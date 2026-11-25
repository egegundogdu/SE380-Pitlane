import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:garaj/core/data/remote/remote_repository.dart';
import 'package:garaj/core/domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late HttpServer server;
  late SupabaseClient client;
  late List<Map<String, dynamic>> captured;
  late List<Uri> requests;
  late Map<String, List<Map<String, dynamic>>> tables;
  dynamic response;

  setUp(() async {
    captured = [];
    requests = [];
    tables = {};
    response = {'id': 'record', 'version': 1};
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    server.listen((request) async {
      requests.add(request.uri);
      request.response.headers.contentType = ContentType.json;
      if (request.uri.path.contains('/rpc/')) {
        captured.add(
          Map<String, dynamic>.from(
            jsonDecode(await utf8.decoder.bind(request).join()) as Map,
          ),
        );
        request.response.write(jsonEncode(response));
      } else {
        final name = request.uri.pathSegments.last;
        final cursor = request.uri.queryParameters['id']?.substring(3);
        final limit = int.parse(request.uri.queryParameters['limit']!);
        final rows =
            (tables[name] ?? [])
                .where(
                  (row) =>
                      cursor == null ||
                      (row['id'] as String).compareTo(cursor) > 0,
                )
                .toList()
              ..sort((a, b) {
                final order = (a['id'] as String).compareTo(b['id'] as String);
                return request.uri.queryParameters['order']?.startsWith(
                          'id.asc',
                        ) ==
                        true
                    ? order
                    : -order;
              });
        request.response.write(jsonEncode(rows.take(limit).toList()));
      }
      await request.response.close();
    });
    client = SupabaseClient(
      'http://127.0.0.1:${server.port}',
      'local-http-test-key',
      authOptions: const AuthClientOptions(autoRefreshToken: false),
    );
  });

  tearDown(() async {
    await client.dispose();
    await server.close(force: true);
  });

  test('snapshot reads all keyset pages beyond the response cap', () async {
    tables['fuel_entries'] = [
      for (var i = 1; i <= 5; i++) {'id': i.toString().padLeft(3, '0')},
    ];
    tables['vehicles'] = [
      {'id': 'vehicle-1'},
      {'id': 'vehicle-2'},
    ];
    final repository = RemoteRepository(client, pageSize: 2);
    final snapshot = await repository.snapshot();
    expect(snapshot['fuel_entries']!.map((row) => row['id']), [
      '001',
      '002',
      '003',
      '004',
      '005',
    ]);
    expect(snapshot['vehicles'], hasLength(2));
    final fuelRequests = requests.where(
      (uri) => uri.path.endsWith('/fuel_entries'),
    );
    expect(fuelRequests, hasLength(3));
    expect(fuelRequests.map((uri) => uri.queryParameters['id']), [
      null,
      'gt.002',
      'gt.004',
    ]);
    expect(
      fuelRequests.every(
        (uri) => uri.queryParameters['order']?.startsWith('id.asc') == true,
      ),
      isTrue,
    );
  });

  test(
    'known maintenance setup strips only the empty form parts field',
    () async {
      final service = ServiceRecord(
        id: 'service',
        vehicleId: 'vehicle',
        performedOn: DateTime.utc(2026, 1, 10),
        title: 'Son bakım',
        resetsInterval: true,
      );
      final payload = {
        'vehicle': {'id': 'vehicle'},
        'reading': {'id': 'reading', 'km': 80000, 'read_on': '2026-10-23'},
        'service': RemoteRepository.servicePayload(service),
      };
      await RemoteRepository(client)
          .save('setup_vehicle', payload, 'operation', null);
      final wire = captured.single['p_payload'] as Map;
      expect((wire['service'] as Map).containsKey('parts'), isFalse);
      expect((wire['service'] as Map)['resets_interval'], isTrue);
      expect((payload['service'] as Map)['parts'], isEmpty);
      expect(captured.single['p_operation_id'], 'operation');
      expect(captured.single['p_expected_version'], isNull);
    },
  );

  test(
    'normal maintenance sends parts and optimistic version unchanged',
    () async {
      final payload = {
        'id': 'service',
        'parts': [
          {'id': 'part', 'label': 'Yağ', 'cost_kurus': 25000},
        ],
      };
      await RemoteRepository(client)
          .save('save_service_record', payload, 'same-operation', 3);
      expect(captured.single['p_payload'], payload);
      expect(captured.single['p_expected_version'], 3);
      expect(captured.single['p_operation_id'], 'same-operation');
    },
  );

  test('delete sends the actual server table inside p_payload', () async {
    await RemoteRepository(client)
        .delete('appraisal', 'report', 'delete-operation', 4);
    expect(captured.single['p_payload'], {
      'table': 'appraisal_reports',
      'id': 'report',
    });
    expect(captured.single['p_expected_version'], 4);
  });

  test('unexpected RPC response is not mistaken for successful save', () async {
    response = [];
    await expectLater(
      RemoteRepository(client)
          .save('save_expense', {'id': 'record'}, 'operation', null),
      throwsFormatException,
    );
  });

  test('wire models preserve nullable maintenance and integer kurus', () {
    final service = ServiceRecord(
      id: 'service',
      vehicleId: 'vehicle',
      performedOn: DateTime.utc(2026, 1, 10),
      title: 'Bakım',
      totalCostKurus: 123456,
    );
    final payload = RemoteRepository.servicePayload(service);
    expect(payload['km'], isNull);
    expect(payload['total_cost_kurus'], 123456);
    expect(payload.keys, isNot(contains('user_id')));
    expect(payload.keys, isNot(contains('version')));
    expect(payload.keys, isNot(contains('last_op_id')));
    final fuel = FuelEntry(
      id: 'fuel',
      vehicleId: 'vehicle',
      filledAt: DateTime.utc(2026, 1, 10, 21, 30),
      fuelType: 'benzin',
      litersMilli: 40125,
      unitPriceKurus: 5200,
      amountKurus: 208650,
    );
    final wire = RemoteRepository.fuelPayload(fuel);
    expect(wire['fuel_type'], 'petrol');
    expect(wire['liters'], 40.125);
    expect(wire['amount_kurus'], 208650);
    expect(wire.keys, isNot(contains('receipt_path')));
    expect(wire.keys, isNot(contains('ocr_rows')));
    expect(wireFuel('dizel'), 'diesel');
    expect(appFuel('diesel'), 'dizel');
  });
}
