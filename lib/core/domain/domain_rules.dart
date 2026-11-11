import 'dart:math' as math;

import 'package:clock/clock.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import 'models.dart';

enum ServiceStatus { unknown, normal, approaching, overdue }

enum ReportGranularity { week, month, year }

enum AlertSeverity { info, warning, critical }

/// Date-only values are represented at UTC midnight, without an instant shift.
DateTime dateOnly(DateTime value) =>
    DateTime.utc(value.year, value.month, value.day);

tz.Location? _istanbulLocation;
tz.Location get _istanbul {
  if (_istanbulLocation == null) {
    tzdata.initializeTimeZones();
    _istanbulLocation = tz.getLocation('Europe/Istanbul');
  }
  return _istanbulLocation!;
}

/// Converts a timestamp into its Turkish reporting date, including historical DST.
DateTime istanbulDate(DateTime timestamp) {
  final local = tz.TZDateTime.from(timestamp, _istanbul);
  return DateTime.utc(local.year, local.month, local.day);
}

/// The timestamp to keep when the user picks calendar [day] for something
/// stored as an instant (a fuel entry). The day [current] already falls on
/// keeps [current]. Any other day gets the middle of the hours that lie on
/// [day] both on this device's calendar and in Istanbul, where reports count
/// days: the picker's local midnight would report as the previous day on a
/// phone east of Istanbul. [device] stands in for the phone's zone in tests.
DateTime pickedDayMoment(
  DateTime day, {
  required DateTime current,
  tz.Location? device,
}) {
  DateTime onDevice(int year, int month, int date) => device == null
      ? DateTime(year, month, date)
      : tz.TZDateTime(device, year, month, date);
  final shown = device == null ? current : tz.TZDateTime.from(current, device);
  if (shown.year == day.year &&
      shown.month == day.month &&
      shown.day == day.day) {
    return current;
  }
  final localStart = onDevice(day.year, day.month, day.day);
  final localEnd = onDevice(day.year, day.month, day.day + 1);
  final turkishStart = tz.TZDateTime(_istanbul, day.year, day.month, day.day);
  final turkishEnd = tz.TZDateTime(_istanbul, day.year, day.month, day.day + 1);
  final start = localStart.isAfter(turkishStart) ? localStart : turkishStart;
  final end = localEnd.isBefore(turkishEnd) ? localEnd : turkishEnd;
  return DateTime.fromMicrosecondsSinceEpoch(
    start.add(end.difference(start) ~/ 2).microsecondsSinceEpoch,
  );
}

/// Adds calendar months and clamps the day to the end of the target month.
DateTime addCalendarMonths(DateTime value, int months) {
  final first = DateTime.utc(value.year, value.month + months);
  final lastDay = DateTime.utc(first.year, first.month + 1, 0).day;
  return DateTime.utc(first.year, first.month, math.min(value.day, lastDay));
}

class ServiceSchedule {
  const ServiceSchedule({
    required this.status,
    this.baseline,
    this.dueDate,
    this.dueKm,
    this.remainingDays,
    this.remainingKm,
    this.progress = 0,
    this.kmUsed,
    this.timeUsed,
  });

  final ServiceStatus status;
  final ServiceRecord? baseline;
  final DateTime? dueDate;
  final int? dueKm;
  final int? remainingDays;
  final int? remainingKm;
  final double progress;

  /// Share of the kilometre interval used, above 1 once passed; null without a
  /// baseline km.
  final double? kmUsed;

  /// Share of the calendar interval used, above 1 once passed; null without a
  /// due date.
  final double? timeUsed;

  /// [kmUsed] bounded to 0–1 for drawing.
  double? get kmProgress => kmUsed?.clamp(0.0, 1.0).toDouble();

  /// [timeUsed] bounded to 0–1 for drawing.
  double? get timeProgress => timeUsed?.clamp(0.0, 1.0).toDouble();

  bool get hasInformation => status != ServiceStatus.unknown;
  bool get atLimit => remainingDays == 0 || remainingKm == 0;

  /// Whichever limit comes first decides the service, so it leads the display.
  /// Unbounded shares decide, so a limit already passed always leads one that
  /// is merely reached.
  bool get limitedByKm =>
      remainingKm != null && (timeUsed == null || (kmUsed ?? 0) >= timeUsed!);
}

class ReportPeriod {
  const ReportPeriod({
    required this.start,
    required this.endExclusive,
    required this.granularity,
  });

  factory ReportPeriod.containing(
    DateTime date,
    ReportGranularity granularity,
  ) {
    final day = dateOnly(date);
    switch (granularity) {
      case ReportGranularity.week:
        final monday = day.subtract(Duration(days: day.weekday - 1));
        return ReportPeriod(
          start: monday,
          endExclusive: monday.add(const Duration(days: 7)),
          granularity: granularity,
        );
      case ReportGranularity.month:
        return ReportPeriod(
          start: DateTime.utc(day.year, day.month),
          endExclusive: DateTime.utc(day.year, day.month + 1),
          granularity: granularity,
        );
      case ReportGranularity.year:
        return ReportPeriod(
          start: DateTime.utc(day.year),
          endExclusive: DateTime.utc(day.year + 1),
          granularity: granularity,
        );
    }
  }

  /// The period holding today's Turkish reporting date. The ledger dates fuel
  /// by Istanbul day, so "this month" must too, whatever the device zone.
  factory ReportPeriod.current(
    ReportGranularity granularity, {
    DateTime? now,
  }) => ReportPeriod.containing(istanbulDate(now ?? clock.now()), granularity);

  final DateTime start;
  final DateTime endExclusive;
  final ReportGranularity granularity;

  bool contains(DateTime date) {
    final day = dateOnly(date);
    return !day.isBefore(start) && day.isBefore(endExclusive);
  }

  ReportPeriod previous([int steps = 1]) => _shift(-steps);
  ReportPeriod next([int steps = 1]) => _shift(steps);

  ReportPeriod _shift(int steps) {
    final shifted = switch (granularity) {
      ReportGranularity.week => start.add(Duration(days: 7 * steps)),
      ReportGranularity.month => DateTime.utc(start.year, start.month + steps),
      ReportGranularity.year => DateTime.utc(start.year + steps),
    };
    return ReportPeriod.containing(shifted, granularity);
  }
}

class CategoryTotal {
  const CategoryTotal({
    required this.category,
    required this.amountKurus,
    required this.percentage,
  });

  final String category;
  final int amountKurus;
  final int percentage;
}

class ExpenseSummary {
  ExpenseSummary({
    required this.totalKurus,
    required List<CategoryTotal> categories,
  }) : categories = List.unmodifiable(categories);

  final int totalKurus;
  final List<CategoryTotal> categories;
}

class FuelSummary {
  const FuelSummary({
    required this.fuelType,
    required this.totalKurus,
    required this.totalLitersMilli,
  });

  final String fuelType;
  final int totalKurus;
  final int totalLitersMilli;

  /// Weighted price, rounded once to a whole kurus for display.
  int? get averageUnitPriceKurus => totalLitersMilli <= 0
      ? null
      : (totalKurus * 1000 + totalLitersMilli ~/ 2) ~/ totalLitersMilli;
}

class RecentStation {
  const RecentStation({
    required this.station,
    required this.lastVisit,
    required this.visitCount,
    required this.lastUnitPriceKurus,
  });

  final Station station;
  final DateTime lastVisit;
  final int visitCount;
  final int lastUnitPriceKurus;

  bool get hasLocation => station.latitude != null && station.longitude != null;
}

class KmConflict {
  const KmConflict({required this.candidate, required this.existing});

  final OdometerReading candidate;
  final OdometerReading existing;
}

class DomainAlert {
  const DomainAlert({
    required this.id,
    required this.vehicleId,
    required this.title,
    required this.message,
    required this.severity,
    required this.sourceType,
    required this.sourceId,
  });

  final String id;
  final String vehicleId;
  final String title;
  final String message;
  final AlertSeverity severity;
  final String sourceType;
  final String sourceId;
}

/// Pure business rules. Persistence and authoritative concurrency checks live
/// in the repositories and database; these rules give immediate UI feedback.
abstract final class DomainRules {
  /// Whole calendar days from today (Istanbul) to a date-only deadline. Every
  /// screen counts documents this way, so an alert and a badge never differ.
  static int daysUntil(DateTime due, {DateTime? now}) =>
      dateOnly(due).difference(istanbulDate(now ?? clock.now())).inDays;

  /// Fuel codes a fuel entry may carry. A vehicle profile may also list
  /// `electric`, which has no litre-based fuel entry.
  static const fuelEntryTypes = <String>['benzin', 'dizel', 'lpg'];

  /// The database's bounds, checked before a record is queued: a value the
  /// server would refuse must not wait in the queue as a lost record.
  static const maxOdometerKm = 10000000;
  static const minModelYear = 1886, maxModelYear = 2100;
  static const maxServiceIntervalKm = 1000000;
  static const minServiceIntervalMonths = 1, maxServiceIntervalMonths = 120;
  static const maxRemindDaysBefore = 365;
  static const maxBrandLength = 100,
      maxModelLength = 150,
      maxPlateLength = 30,
      maxTitleLength = 250;

  /// How long a queued change may be retried as it was. The server keeps
  /// retry receipts for 90 days (migration 20261025000600); after that a
  /// retry counts as new and could bring back a record deleted meanwhile, so
  /// older changes wait for the user to confirm them. Ten days of margin.
  static const maxQueuedAge = Duration(days: 80);

  /// Free text: notes, addresses and short labels (migration 20261025000700).
  static const maxNoteLength = 2000,
      maxDetailLength = 500,
      maxLabelLength = 100,
      maxTaxNoLength = 20;

  /// Why the server would refuse [vehicle], or null when it would accept it.
  static String? vehicleProblem(Vehicle vehicle) {
    final brand = vehicle.brand.trim().length,
        model = vehicle.model.trim().length,
        plate = vehicle.plate.trim().length;
    if (brand == 0 || brand > maxBrandLength) {
      return 'Marka 1 ile $maxBrandLength karakter arasında olmalı.';
    }
    if (model == 0 || model > maxModelLength) {
      return 'Model 1 ile $maxModelLength karakter arasında olmalı.';
    }
    if (plate == 0 || plate > maxPlateLength) {
      return 'Plaka 1 ile $maxPlateLength karakter arasında olmalı.';
    }
    if (vehicle.color.length > maxLabelLength ||
        vehicle.engine.length > maxLabelLength) {
      return 'Renk ve motor bilgisi en fazla $maxLabelLength karakter olabilir.';
    }
    if (vehicle.engineStatusNote.length > maxDetailLength) {
      return 'Motor notu en fazla $maxDetailLength karakter olabilir.';
    }
    if (vehicle.year != 0 &&
        (vehicle.year < minModelYear || vehicle.year > maxModelYear)) {
      return 'Model yılı $minModelYear ile $maxModelYear arasında olmalı.';
    }
    if (vehicle.serviceIntervalKm < 1 ||
        vehicle.serviceIntervalKm > maxServiceIntervalKm) {
      return 'Bakım aralığı 1 ile 1.000.000 km arasında olmalı.';
    }
    if (vehicle.serviceIntervalMonths < minServiceIntervalMonths ||
        vehicle.serviceIntervalMonths > maxServiceIntervalMonths) {
      return 'Zaman aralığı $minServiceIntervalMonths ile '
          '$maxServiceIntervalMonths ay arasında olmalı.';
    }
    if (vehicle.remindKmBefore < 0 ||
        vehicle.remindDaysBefore < 0 ||
        vehicle.remindDaysBefore > maxRemindDaysBefore) {
      return 'Hatırlatma eşikleri 0 ile $maxRemindDaysBefore gün arasında '
          'olmalı.';
    }
    return null;
  }

  /// Maps legacy/receipt spellings onto [fuelEntryTypes] codes.
  static String canonicalFuelType(String value) => switch (value) {
    'motorin' || 'diesel' => 'dizel',
    'petrol' => 'benzin',
    _ => value,
  };

  /// Plates compare as printed on receipts: case, spaces and hyphens ignored.
  static String plateKey(String plate) =>
      plate.replaceAll(RegExp(r'[^0-9A-Za-z]'), '').toUpperCase();

  /// The garage vehicle a receipt plate belongs to, only if exactly one
  /// matches. It is a suggestion; the selected vehicle never changes by itself.
  static Vehicle? vehicleForPlate(Iterable<Vehicle> vehicles, String plate) {
    final key = plateKey(plate);
    if (key.isEmpty) return null;
    final matches = vehicles.where((v) => plateKey(v.plate) == key).toList();
    return matches.length == 1 ? matches.single : null;
  }

  static const categoryLabels = <String, String>{
    'fuel': 'Yakıt',
    'service': 'Bakım / Onarım',
    'insurance': 'Sigorta / Kasko',
    'tax_fees': 'Vergi / Muayene',
    'parking_toll': 'Otopark / Otoyol',
    'wash': 'Yıkama',
    'fines': 'Ceza',
    'other': 'Diğer',
  };

  static List<OdometerReading> odometerLog({
    Iterable<OdometerReading> manual = const [],
    Iterable<FuelEntry> fuel = const [],
    Iterable<ServiceRecord> services = const [],
    String? vehicleId,
  }) {
    final rows =
        <OdometerReading>[
              ...manual,
              for (final entry in fuel)
                if (entry.odometerKm != null)
                  OdometerReading(
                    id: 'fuel:${entry.id}',
                    vehicleId: entry.vehicleId,
                    km: entry.odometerKm!,
                    readOn: istanbulDate(entry.filledAt),
                    sourceType: 'fuel',
                    sourceId: entry.id,
                    version: entry.version,
                  ),
              for (final entry in services)
                if (entry.km != null)
                  OdometerReading(
                    id: 'service:${entry.id}',
                    vehicleId: entry.vehicleId,
                    km: entry.km!,
                    readOn: dateOnly(entry.performedOn),
                    sourceType: 'service',
                    sourceId: entry.id,
                    version: entry.version,
                  ),
            ]
            .where((entry) => vehicleId == null || entry.vehicleId == vehicleId)
            .toList();
    rows.sort((a, b) {
      final byDay = dateOnly(a.readOn).compareTo(dateOnly(b.readOn));
      if (byDay != 0) return byDay;
      final byKm = a.km.compareTo(b.km);
      return byKm != 0 ? byKm : a.id.compareTo(b.id);
    });
    return List.unmodifiable(rows);
  }

  static OdometerReading? latestReading(
    Iterable<OdometerReading> readings, {
    String? vehicleId,
  }) {
    OdometerReading? latest;
    for (final row in readings) {
      if (vehicleId != null && row.vehicleId != vehicleId) continue;
      if (latest == null ||
          dateOnly(row.readOn).isAfter(dateOnly(latest.readOn)) ||
          (dateOnly(row.readOn) == dateOnly(latest.readOn) &&
              row.km > latest.km)) {
        latest = row;
      }
    }
    return latest;
  }

  static int? currentKm(
    Iterable<OdometerReading> readings, {
    String? vehicleId,
  }) => latestReading(readings, vehicleId: vehicleId)?.km;

  static List<KmConflict> kilometerConflicts({
    required OdometerReading candidate,
    required Iterable<OdometerReading> readings,
  }) {
    final candidateDay = dateOnly(candidate.readOn);
    return List.unmodifiable([
      for (final row in readings)
        if (row.vehicleId == candidate.vehicleId &&
            row.id != candidate.id &&
            !(candidate.sourceId.isNotEmpty &&
                row.sourceType == candidate.sourceType &&
                row.sourceId == candidate.sourceId) &&
            ((dateOnly(row.readOn).isBefore(candidateDay) &&
                    row.km > candidate.km) ||
                (dateOnly(row.readOn).isAfter(candidateDay) &&
                    row.km < candidate.km)))
          KmConflict(candidate: candidate, existing: row),
    ]);
  }

  static ServiceSchedule nextService({
    required Vehicle vehicle,
    required Iterable<ServiceRecord> services,
    required int? currentKm,
    DateTime? now,
  }) {
    final candidates =
        services
            .where((row) => row.vehicleId == vehicle.id && row.resetsInterval)
            .toList()
          ..sort((a, b) {
            final byDay = dateOnly(b.performedOn)
                .compareTo(dateOnly(a.performedOn));
            if (byDay != 0) return byDay;
            final byKm = (b.km ?? -1).compareTo(a.km ?? -1);
            return byKm != 0 ? byKm : b.id.compareTo(a.id);
          });
    if (candidates.isEmpty) {
      return const ServiceSchedule(status: ServiceStatus.unknown);
    }
    final baseline = candidates.first;
    final today = istanbulDate(now ?? clock.now());
    final dueDate = vehicle.serviceIntervalMonths > 0
        ? addCalendarMonths(baseline.performedOn, vehicle.serviceIntervalMonths)
        : null;
    final dueKm = baseline.km != null && vehicle.serviceIntervalKm > 0
        ? baseline.km! + vehicle.serviceIntervalKm
        : null;
    final remainingDays = dueDate?.difference(today).inDays;
    final remainingKm = dueKm != null && currentKm != null
        ? dueKm - currentKm
        : null;
    if (dueDate == null && dueKm == null) {
      return ServiceSchedule(status: ServiceStatus.unknown, baseline: baseline);
    }
    final overdue =
        (remainingKm != null && remainingKm < 0) ||
        (remainingDays != null && remainingDays < 0);
    final approaching =
        (remainingKm != null && remainingKm <= vehicle.remindKmBefore) ||
        (remainingDays != null && remainingDays <= vehicle.remindDaysBefore);
    final kmProgress = remainingKm == null
        ? null
        : 1 - remainingKm / vehicle.serviceIntervalKm;
    final dateSpan = dueDate?.difference(dateOnly(baseline.performedOn)).inDays;
    final dateProgress =
        remainingDays == null || dateSpan == null || dateSpan <= 0
        ? null
        : 1 - remainingDays / dateSpan;
    final progress = (kmProgress ?? dateProgress ?? 0.0)
        .clamp(0.0, 1.0)
        .toDouble();
    return ServiceSchedule(
      status: overdue
          ? ServiceStatus.overdue
          : approaching
          ? ServiceStatus.approaching
          : ServiceStatus.normal,
      baseline: baseline,
      dueDate: dueDate,
      dueKm: dueKm,
      remainingDays: remainingDays,
      remainingKm: remainingKm,
      progress: progress,
      kmUsed: kmProgress,
      timeUsed: dateProgress,
    );
  }

  static List<LedgerEntry> ledger({
    Iterable<FuelEntry> fuel = const [],
    Iterable<ServiceRecord> services = const [],
    Iterable<Expense> expenses = const [],
    String? vehicleId,
  }) {
    final entries = <LedgerEntry>[
      for (final row in fuel)
        LedgerEntry(
          id: 'fuel:${row.id}',
          vehicleId: row.vehicleId,
          date: istanbulDate(row.filledAt),
          category: 'fuel',
          amountKurus: row.amountKurus,
          title: row.stationName.isEmpty ? 'Yakıt alımı' : row.stationName,
          sourceType: 'fuel',
          sourceId: row.id,
        ),
      for (final row in services)
        if (row.totalCostKurus > 0)
          LedgerEntry(
            id: 'service:${row.id}',
            vehicleId: row.vehicleId,
            date: dateOnly(row.performedOn),
            category: 'service',
            amountKurus: row.totalCostKurus,
            title: row.title,
            sourceType: 'service',
            sourceId: row.id,
          ),
      for (final row in expenses)
        if (row.category != 'fuel' && row.category != 'service')
          LedgerEntry(
            id: 'expense:${row.id}',
            vehicleId: row.vehicleId,
            date: dateOnly(row.spentOn),
            category: row.category,
            amountKurus: row.amountKurus,
            title: row.title,
            sourceType: 'expense',
            sourceId: row.id,
          ),
    ].where((row) => vehicleId == null || row.vehicleId == vehicleId).toList();
    entries.sort((a, b) {
      final byDay = b.date.compareTo(a.date);
      return byDay != 0 ? byDay : a.id.compareTo(b.id);
    });
    return List.unmodifiable(entries);
  }

  static ExpenseSummary aggregate(
    Iterable<LedgerEntry> entries,
    ReportPeriod period,
  ) {
    final totals = <String, int>{};
    for (final entry in entries) {
      if (!period.contains(entry.date) || entry.amountKurus <= 0) continue;
      totals.update(
        entry.category,
        (value) => value + entry.amountKurus,
        ifAbsent: () => entry.amountKurus,
      );
    }
    final total = totals.values.fold<int>(0, (sum, value) => sum + value);
    if (total == 0) return ExpenseSummary(totalKurus: 0, categories: []);
    final categories = totals.keys.toList()
      ..sort((a, b) {
        final byAmount = totals[b]!.compareTo(totals[a]!);
        return byAmount != 0 ? byAmount : a.compareTo(b);
      });
    final percentages = <String, int>{
      for (final category in categories)
        category: totals[category]! * 100 ~/ total,
    };
    final ranked = [...categories]
      ..sort((a, b) {
        final remainder = (totals[b]! * 100 % total).compareTo(
          totals[a]! * 100 % total,
        );
        return remainder != 0 ? remainder : a.compareTo(b);
      });
    var left =
        100 - percentages.values.fold<int>(0, (sum, value) => sum + value);
    for (var i = 0; i < ranked.length && left > 0; i++, left--) {
      percentages[ranked[i]] = percentages[ranked[i]]! + 1;
    }
    return ExpenseSummary(
      totalKurus: total,
      categories: [
        for (final category in categories)
          CategoryTotal(
            category: category,
            amountKurus: totals[category]!,
            percentage: percentages[category]!,
          ),
      ],
    );
  }

  static List<ExpenseSummary> trend(
    Iterable<LedgerEntry> entries,
    ReportPeriod period, {
    int count = 6,
  }) => List.unmodifiable([
    for (var offset = count - 1; offset >= 0; offset--)
      aggregate(entries, period.previous(offset)),
  ]);

  static List<FuelSummary> fuelSummaries(
    Iterable<FuelEntry> entries, {
    ReportPeriod? period,
    String? vehicleId,
  }) {
    final totals = <String, (int, int)>{};
    for (final row in entries) {
      if ((vehicleId != null && row.vehicleId != vehicleId) ||
          (period != null && !period.contains(istanbulDate(row.filledAt)))) {
        continue;
      }
      final old = totals[row.fuelType] ?? (0, 0);
      totals[row.fuelType] = (
        old.$1 + row.amountKurus,
        old.$2 + row.litersMilli,
      );
    }
    final keys = totals.keys.toList()..sort();
    return List.unmodifiable([
      for (final key in keys)
        FuelSummary(
          fuelType: key,
          totalKurus: totals[key]!.$1,
          totalLitersMilli: totals[key]!.$2,
        ),
    ]);
  }

  static List<RecentStation> recentStations({
    required Iterable<FuelEntry> fuel,
    required Iterable<Station> stations,
    required String vehicleId,
    int limit = 5,
  }) {
    final byId = {for (final station in stations) station.id: station};
    final ordered =
        fuel
            .where(
              (row) =>
                  row.vehicleId == vehicleId && byId.containsKey(row.stationId),
            )
            .toList()
          ..sort((a, b) {
            final byDate = b.filledAt.compareTo(a.filledAt);
            return byDate != 0 ? byDate : a.id.compareTo(b.id);
          });
    final counts = <String, int>{};
    for (final row in ordered) {
      counts.update(row.stationId!, (count) => count + 1, ifAbsent: () => 1);
    }
    final seen = <String>{};
    final result = <RecentStation>[];
    for (final row in ordered) {
      if (!seen.add(row.stationId!) || result.length >= limit) continue;
      result.add(
        RecentStation(
          station: byId[row.stationId]!,
          lastVisit: row.filledAt,
          visitCount: counts[row.stationId]!,
          lastUnitPriceKurus: row.unitPriceKurus,
        ),
      );
    }
    return List.unmodifiable(result);
  }

  static List<DomainAlert> alerts({
    required Vehicle vehicle,
    required Iterable<ServiceRecord> services,
    required Iterable<OdometerReading> readings,
    Iterable<VehicleIssue> issues = const [],
    DateTime? now,
  }) {
    final instant = now ?? clock.now();
    final today = istanbulDate(instant);
    final latest = latestReading(readings, vehicleId: vehicle.id);
    final service = nextService(
      vehicle: vehicle,
      services: services,
      currentKm: latest?.km,
      now: instant,
    );
    final result = <DomainAlert>[];
    void add(
      String suffix,
      String title,
      String message,
      AlertSeverity severity, {
      String sourceType = 'system',
      String? sourceId,
    }) {
      result.add(
        DomainAlert(
          id: '${vehicle.id}:$suffix',
          vehicleId: vehicle.id,
          title: title,
          message: message,
          severity: severity,
          sourceType: sourceType,
          sourceId: sourceId ?? vehicle.id,
        ),
      );
    }

    switch (service.status) {
      case ServiceStatus.unknown:
        add(
          'service',
          'Bakım bilgisi gerekli',
          'Son bilinen bakımınızı ekleyin.',
          AlertSeverity.info,
        );
      case ServiceStatus.overdue:
        add(
          'service',
          'Bakım zamanı geçti',
          'Bakım tarihi veya kilometre sınırı aşıldı.',
          AlertSeverity.critical,
        );
      case ServiceStatus.approaching:
        add(
          'service',
          service.atLimit ? 'Bakım zamanı geldi' : 'Bakım yaklaşıyor',
          'Bakım tarihinizi ve kilometre sınırını kontrol edin.',
          AlertSeverity.warning,
        );
      case ServiceStatus.normal:
        break;
    }
    void document(
      String key,
      String label,
      DateTime? due, {
      bool required = false,
    }) {
      if (due == null) {
        if (required) {
          add(
            key,
            '$label tarihi eksik',
            'Son geçerlilik tarihini ekleyebilirsiniz.',
            AlertSeverity.info,
          );
        }
        return;
      }
      final remaining = daysUntil(due, now: instant);
      if (remaining < 0) {
        add(
          key,
          '$label tarihi geçti',
          '${-remaining} gün geçti.',
          AlertSeverity.critical,
        );
      } else if (remaining <= 30) {
        add(
          key,
          '$label yaklaşıyor',
          remaining == 0 ? 'Son gün bugün.' : '$remaining gün kaldı.',
          AlertSeverity.warning,
        );
      }
    }

    document('inspection', 'Muayene', vehicle.inspectionDue, required: true);
    document(
      'insurance',
      'Trafik sigortası',
      vehicle.trafficInsuranceDue,
      required: true,
    );
    document('casco', 'Kasko', vehicle.cascoDue);
    if (latest == null ||
        today.difference(dateOnly(latest.readOn)).inDays > 30) {
      add(
        'odometer',
        'Kilometreyi güncelleyin',
        latest == null
            ? 'Henüz kilometre kaydı yok.'
            : 'Son kayıt 30 günden eski.',
        AlertSeverity.info,
      );
    }
    for (final issue in issues) {
      if (issue.vehicleId != vehicle.id || issue.resolvedAt != null) continue;
      final severity = AlertSeverity.values.firstWhere(
        (value) => value.name == issue.severity,
        orElse: () => AlertSeverity.warning,
      );
      add(
        'issue:${issue.id}',
        issue.title,
        'Eklediğin açık sorun. Giderince çözüldü olarak işaretle.',
        severity,
        sourceType: 'issue',
        sourceId: issue.id,
      );
    }
    result.sort((a, b) {
      final bySeverity = b.severity.index.compareTo(a.severity.index);
      return bySeverity != 0 ? bySeverity : a.id.compareTo(b.id);
    });
    return List.unmodifiable(result);
  }
}
