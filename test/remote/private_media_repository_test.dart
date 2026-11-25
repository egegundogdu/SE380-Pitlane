import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:garaj/core/data/remote/private_media_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late HttpServer server;
  late SupabaseClient client;
  late PrivateMediaRepository repository;
  late List<String> methods;
  late List<Uint8List> uploads;
  late List<String> contentTypes;
  var exists = false;
  var loseUploadResponse = false;
  const path = 'user/vehicle/document.pdf';
  final bytes = Uint8List.fromList(utf8.encode('%PDF-1.4 LOCAL-TEST'));

  setUp(() async {
    methods = [];
    uploads = [];
    contentTypes = [];
    exists = false;
    loseUploadResponse = false;
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) async {
      methods.add(request.method);
      if (request.method == 'HEAD') {
        request.response.statusCode = exists ? 200 : 404;
        await request.response.close();
        return;
      }
      if (request.method == 'POST') {
        uploads.add(
          Uint8List.fromList(
            await request.fold<List<int>>([], (a, b) => a..addAll(b)),
          ),
        );
        contentTypes.add(request.headers.contentType.toString());
        exists = true; // The binary committed even if its HTTP reply gets lost.
        if (loseUploadResponse) {
          final socket = await request.response.detachSocket(
            writeHeaders: false,
          );
          socket.destroy();
          return;
        }
        request.response.headers.contentType = ContentType.json;
        request.response.write(jsonEncode({'Key': 'appraisals/$path'}));
        await request.response.close();
        return;
      }
      request.response.add(bytes);
      await request.response.close();
    });
    client = SupabaseClient(
      'http://127.0.0.1:${server.port}',
      'local-storage-test-key',
      authOptions: const AuthClientOptions(autoRefreshToken: false),
    );
    repository = PrivateMediaRepository(client);
  });

  tearDown(() async {
    await client.dispose();
    await server.close(force: true);
  });

  test(
    'existing immutable object skips reading and uploading local bytes',
    () async {
      exists = true;
      await repository.ensureUploaded(
        bucket: 'appraisals',
        path: path,
        mime: 'application/pdf',
        readBytes: () async =>
            throw StateError('Must not read an existing object'),
      );
      expect(methods, ['HEAD']);
      expect(uploads, isEmpty);
    },
  );

  test(
    'missing object uploads original bytes with explicit document MIME',
    () async {
      await repository.ensureUploaded(
        bucket: 'appraisals',
        path: path,
        mime: 'application/pdf',
        readBytes: () async => bytes,
      );
      expect(methods, ['HEAD', 'POST']);
      expect(contentTypes.single, startsWith('multipart/form-data;'));
      final multipart = utf8.decode(uploads.single);
      expect(
        multipart.toLowerCase(),
        contains('content-type: application/pdf'),
      );
      expect(multipart, contains('%PDF-1.4 LOCAL-TEST'));
    },
  );

  test(
    'committed upload with lost transport reply rechecks object existence',
    () async {
      loseUploadResponse = true;
      await repository.ensureUploaded(
        bucket: 'appraisals',
        path: path,
        mime: 'application/pdf',
        readBytes: () async => bytes,
      );
      expect(methods, ['HEAD', 'POST', 'HEAD']);
      expect(uploads, hasLength(1));
    },
  );

  test(
    'receipt bucket rejects before any network or private-byte access',
    () async {
      await expectLater(
        repository.ensureUploaded(
          bucket: 'receipts',
          path: path,
          mime: 'image/jpeg',
          readBytes: () async =>
              throw StateError('Receipt must stay on device'),
        ),
        throwsArgumentError,
      );
      await expectLater(
        () => repository.download('receipts', path),
        throwsArgumentError,
      );
      expect(methods, isEmpty);
    },
  );

  test('missing local bytes cannot create an empty cloud document', () async {
    await expectLater(
      repository.ensureUploaded(
        bucket: 'vehicle-photos',
        path: 'user/vehicle/photo.jpg',
        mime: 'image/jpeg',
        readBytes: () async => null,
      ),
      throwsStateError,
    );
    expect(methods, ['HEAD']);
    expect(uploads, isEmpty);
  });
}
