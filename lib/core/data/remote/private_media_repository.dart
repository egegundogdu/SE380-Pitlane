import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final privateMediaProvider = Provider<PrivateMediaRepository>(
  (ref) => PrivateMediaRepository(Supabase.instance.client),
);

/// Only appraisal documents and vehicle photos may enter cloud Storage.
/// Receipt images and OCR archives have no path through this repository.
class PrivateMediaRepository {
  PrivateMediaRepository(this.client);
  final SupabaseClient client;

  StorageFileApi _bucket(String bucket) {
    if (bucket != 'appraisals' && bucket != 'vehicle-photos') {
      throw ArgumentError.value(bucket, 'bucket');
    }
    return client.storage.from(bucket);
  }

  Future<void> ensureUploaded({
    required String bucket,
    required String path,
    required String mime,
    required Future<Uint8List?> Function() readBytes,
  }) async {
    final storage = _bucket(bucket);
    if (await storage.exists(path)) return;
    final bytes = await readBytes();
    if (bytes == null) {
      throw StateError(
        'Belgenin cihazdaki kopyası bulunamadı. Yeniden ekleyin.',
      );
    }
    try {
      await storage.uploadBinary(
        path,
        bytes,
        fileOptions: FileOptions(contentType: mime),
      );
    } catch (error, stack) {
      // A previous upload may have committed while its response was lost.
      try {
        if (await storage.exists(path)) return;
      } catch (_) {
        // Preserve the upload error when the recovery probe is also offline.
      }
      Error.throwWithStackTrace(error, stack);
    }
  }

  Future<Uint8List> download(String bucket, String path) =>
      _bucket(bucket).download(path);
}
