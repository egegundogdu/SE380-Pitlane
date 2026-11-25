import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/domain.dart';

Map<String, dynamic> _row(dynamic value) =>
    Map<String, dynamic>.from(value as Map);
DateTime _date(dynamic value) => DateTime.parse(value as String);
DateTime? _nullableDate(dynamic value) => value == null ? null : _date(value);

/// Instants (`timestamptz`) arrive in UTC; held in device time like the rest
/// of the app's instants, not as UTC components.
DateTime? _nullableMoment(dynamic value) => _nullableDate(value)?.toLocal();
int _integer(dynamic value, [int fallback = 0]) =>
    value == null ? fallback : (value as num).round();

String wireFuel(String value) => switch (value) {
  'benzin' => 'petrol',
  'dizel' || 'motorin' => 'diesel',
  _ => value,
};
String appFuel(String value) => switch (value) {
  'petrol' => 'benzin',
  'diesel' => 'dizel',
  _ => value,
};

class RemoteRepository {
  RemoteRepository(this.client, {this.pageSize = 500})
    : assert(pageSize > 0 && pageSize <= 1000);
  final SupabaseClient client;
  final int pageSize;
  Future<Map<String, List<dynamic>>> snapshot() async {
    const names = [
      'vehicles',
      'odometer_readings',
      'fuel_entries',
      'service_records',
      'service_parts',
      'expenses',
      'vehicle_issues',
      'stations',
      'appraisal_reports',
    ];
    final values = await Future.wait(names.map(_readAll));
    return {for (var i = 0; i < names.length; i++) names[i]: values[i]};
  }

  /// Stable keyset pages avoid the PostgREST response cap silently truncating a
  /// vehicle's long-term fuel/service history. UUID cursors also avoid offset
  /// shifts when another device adds/deletes a row during a refresh.
  Future<List<dynamic>> _readAll(String table) async {
    final rows = <dynamic>[];
    String? afterId;
    while (true) {
      var query = client.from(table).select();
      if (afterId != null) query = query.gt('id', afterId);
      final page = await query.order('id', ascending: true).limit(pageSize);
      rows.addAll(page);
      if (page.length < pageSize) return rows;
      final next = page.last['id'] as String?;
      if (next == null || next == afterId) {
        throw const FormatException('Sunucu kayıt sayfalaması ilerlemedi.');
      }
      afterId = next;
    }
  }

  Future<Map<String, dynamic>> save(
    String rpc,
    Map<String, dynamic> payload,
    String operationId,
    int? version,
  ) async {
    final wirePayload = Map<String, dynamic>.from(payload);
    if (rpc == 'setup_vehicle' && wirePayload['service'] is Map) {
      // Setup creates a baseline record, not the complete maintenance form.
      // servicePayload also serves save_service_record, whose parts field is
      // intentionally absent from the direct baseline SQL row contract.
      final service = Map<String, dynamic>.from(wirePayload['service'] as Map);
      final parts = service.remove('parts');
      if (parts != null && (parts is! List || parts.isNotEmpty)) {
        throw ArgumentError(
          'Kurulumda parça listesi bakım formundan eklenmeli.',
        );
      }
      wirePayload['service'] = service;
    }
    final response = await client.rpc(
      rpc,
      params: {
        'p_payload': wirePayload,
        'p_operation_id': operationId,
        'p_expected_version': version,
      },
    );
    if (response is! Map) {
      throw const FormatException('Sunucudan beklenmeyen kayıt yanıtı alındı.');
    }
    return _row(response);
  }

  Future<void> delete(
    String sourceType,
    String id,
    String operationId,
    int version,
  ) async {
    const tables = {
      'vehicle': 'vehicles',
      'fuel': 'fuel_entries',
      'service': 'service_records',
      'expense': 'expenses',
      'reading': 'odometer_readings',
      'issue': 'vehicle_issues',
      'appraisal': 'appraisal_reports',
      'station': 'stations',
    };
    final table = tables[sourceType];
    if (table == null) throw ArgumentError.value(sourceType, 'sourceType');
    await client.rpc(
      'delete_record',
      params: {
        'p_payload': {'table': table, 'id': id},
        'p_operation_id': operationId,
        'p_expected_version': version,
      },
    );
  }

  static Vehicle vehicle(dynamic input) {
    final r = _row(input);
    return Vehicle(
      id: r['id'],
      userId: r['user_id'],
      brand: r['brand'],
      model: r['model'],
      year: _integer(r['year']),
      plate: r['plate'],
      engine: r['engine'] ?? '',
      color: r['color'] ?? '',
      fuelTypes: List<String>.from(r['fuel_types'] ?? ['petrol'])
          .map(appFuel)
          .toList(),
      serviceIntervalKm: _integer(r['service_interval_km'], 15000),
      serviceIntervalMonths: _integer(r['service_interval_months'], 12),
      remindKmBefore: _integer(r['remind_km_before'], 1000),
      remindDaysBefore: _integer(r['remind_days_before'], 14),
      remindersEnabled: r['reminders_enabled'] ?? false,
      inspectionDue: _nullableDate(r['inspection_due']),
      trafficInsuranceDue: _nullableDate(r['traffic_insurance_due']),
      cascoDue: _nullableDate(r['casco_due']),
      fuelLevelPct: r['fuel_level_pct'] == null
          ? null
          : _integer(r['fuel_level_pct']),
      fuelLevelAt: _nullableMoment(r['fuel_level_at']),
      engineStatus: r['engine_status'] ?? 'unknown',
      engineStatusAt: _nullableMoment(r['engine_status_at']),
      engineStatusNote: r['engine_status_note'] ?? '',
      photoPath: r['photo_path'],
      version: _integer(r['version'], 1),
    );
  }

  static OdometerReading reading(dynamic input) {
    final r = _row(input);
    return OdometerReading(
      id: r['id'],
      vehicleId: r['vehicle_id'],
      km: _integer(r['km']),
      readOn: _date(r['read_on']),
      sourceType: 'manual',
      sourceId: r['id'],
      version: _integer(r['version'], 1),
    );
  }

  static Station station(dynamic input) {
    final r = _row(input);
    return Station(
      id: r['id'],
      name: r['name'],
      brand: r['brand'] ?? '',
      address: r['address'] ?? '',
      taxNo: r['tax_no'] ?? '',
      latitude: (r['lat'] as num?)?.toDouble(),
      longitude: (r['lng'] as num?)?.toDouble(),
      version: _integer(r['version'], 1),
    );
  }

  static FuelEntry fuel(dynamic input, List<Station> stations) {
    final r = _row(input);
    final matching = stations.where((s) => s.id == r['station_id']);
    return FuelEntry(
      id: r['id'],
      vehicleId: r['vehicle_id'],
      filledAt: _date(r['filled_at']).toLocal(),
      fuelType: appFuel(r['fuel_type']),
      litersMilli: ((num.tryParse('${r['liters']}') ?? 0) * 1000).round(),
      unitPriceKurus: _integer(r['unit_price_kurus']),
      amountKurus: _integer(r['amount_kurus']),
      stationId: r['station_id'],
      stationName: matching.isEmpty ? '' : matching.first.name,
      odometerKm: r['odometer_km'] == null ? null : _integer(r['odometer_km']),
      isFullTank: r['is_full_tank'] ?? false,
      notes: r['notes'] ?? '',
      version: _integer(r['version'], 1),
    );
  }

  static ServiceRecord service(dynamic input, List<dynamic> parts) {
    final r = _row(input);
    return ServiceRecord(
      id: r['id'],
      vehicleId: r['vehicle_id'],
      performedOn: _date(r['performed_on']),
      title: r['title'],
      km: r['km'] == null ? null : _integer(r['km']),
      type: r['type'] ?? 'periodic',
      workshop: r['workshop'] ?? '',
      totalCostKurus: _integer(r['total_cost_kurus']),
      notes: r['notes'] ?? '',
      resetsInterval: r['resets_interval'] ?? false,
      parts: parts
          .map(_row)
          .where((p) => p['service_record_id'] == r['id'])
          .map(
            (p) => ServicePart(
              id: p['id'],
              label: p['label'],
              costKurus: _integer(p['cost_kurus']),
            ),
          )
          .toList(),
      version: _integer(r['version'], 1),
    );
  }

  static Expense expense(dynamic input) {
    final r = _row(input);
    return Expense(
      id: r['id'],
      vehicleId: r['vehicle_id'],
      spentOn: _date(r['spent_on']),
      category: r['category'],
      amountKurus: _integer(r['amount_kurus']),
      title: r['title'],
      notes: r['notes'] ?? '',
      version: _integer(r['version'], 1),
    );
  }

  static VehicleIssue issue(dynamic input) {
    final r = _row(input);
    return VehicleIssue(
      id: r['id'],
      vehicleId: r['vehicle_id'],
      title: r['title'],
      severity: r['severity'] ?? 'warning',
      resolvedAt: _nullableMoment(r['resolved_at']),
      version: _integer(r['version'], 1),
    );
  }

  static AppraisalReport appraisal(dynamic input) {
    final r = _row(input);
    return AppraisalReport(
      id: r['id'],
      vehicleId: r['vehicle_id'],
      reportDate: _date(r['report_date']),
      company: r['company'] ?? '',
      filePath: r['file_path'],
      mimeType: r['mime_type'],
      km: r['km'] == null ? null : _integer(r['km']),
      notes: r['notes'] ?? '',
      version: _integer(r['version'], 1),
    );
  }

  static String? day(DateTime? value) =>
      value?.toIso8601String().substring(0, 10);
  static Map<String, dynamic> vehiclePayload(Vehicle v) => {
    'id': v.id,
    'brand': v.brand,
    'model': v.model,
    'year': v.year > 0 ? v.year : null,
    'plate': v.plate,
    'engine': v.engine,
    'color': v.color,
    'fuel_types': v.fuelTypes.map(wireFuel).toList(),
    'service_interval_km': v.serviceIntervalKm,
    'service_interval_months': v.serviceIntervalMonths,
    'remind_km_before': v.remindKmBefore,
    'remind_days_before': v.remindDaysBefore,
    'reminders_enabled': v.remindersEnabled,
    'inspection_due': day(v.inspectionDue),
    'traffic_insurance_due': day(v.trafficInsuranceDue),
    'casco_due': day(v.cascoDue),
    'fuel_level_pct': v.fuelLevelPct,
    'fuel_level_at': v.fuelLevelAt?.toUtc().toIso8601String(),
    'engine_status': v.engineStatus,
    'engine_status_at': v.engineStatusAt?.toUtc().toIso8601String(),
    'engine_status_note': v.engineStatusNote,
    'photo_path': v.photoPath,
  };
  static Map<String, dynamic> stationPayload(Station s) => {
    'id': s.id,
    'name': s.name,
    'brand': s.brand,
    'address': s.address,
    'tax_no': s.taxNo.isEmpty ? null : s.taxNo,
    'lat': s.latitude,
    'lng': s.longitude,
  };
  static Map<String, dynamic> fuelPayload(FuelEntry f) => {
    'id': f.id,
    'vehicle_id': f.vehicleId,
    'filled_at': f.filledAt.toUtc().toIso8601String(),
    'fuel_type': wireFuel(f.fuelType),
    'liters': f.litersMilli / 1000,
    'unit_price_kurus': f.unitPriceKurus > 0 ? f.unitPriceKurus : null,
    'amount_kurus': f.amountKurus,
    'station_id': f.stationId,
    'odometer_km': f.odometerKm,
    'is_full_tank': f.isFullTank,
    'notes': f.notes,
  };
  static Map<String, dynamic> servicePayload(ServiceRecord s) => {
    'id': s.id,
    'vehicle_id': s.vehicleId,
    'performed_on': day(s.performedOn),
    'km': s.km,
    'type': s.type,
    'title': s.title,
    'workshop': s.workshop,
    'total_cost_kurus': s.totalCostKurus,
    'notes': s.notes,
    'resets_interval': s.resetsInterval,
    'parts': s.parts
        .map((p) => {'id': p.id, 'label': p.label, 'cost_kurus': p.costKurus})
        .toList(),
  };
  static Map<String, dynamic> expensePayload(Expense e) => {
    'id': e.id,
    'vehicle_id': e.vehicleId,
    'spent_on': day(e.spentOn),
    'category': e.category,
    'amount_kurus': e.amountKurus,
    'title': e.title,
    'notes': e.notes,
  };
  static Map<String, dynamic> issuePayload(VehicleIssue i) => {
    'id': i.id,
    'vehicle_id': i.vehicleId,
    'title': i.title,
    'severity': i.severity,
    'resolved_at': i.resolvedAt?.toUtc().toIso8601String(),
  };
  static Map<String, dynamic> readingPayload(OdometerReading r) => {
    'id': r.id,
    'vehicle_id': r.vehicleId,
    'km': r.km,
    'read_on': day(r.readOn),
    'source': 'manual',
  };
}
