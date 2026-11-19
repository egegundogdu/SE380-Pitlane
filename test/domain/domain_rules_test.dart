import 'package:flutter_test/flutter_test.dart';
import 'package:garaj/core/domain/domain.dart';

const vehicle = Vehicle(
  id: 'car',
  userId: 'owner',
  brand: 'BMW',
  model: '320i',
  year: 2019,
  plate: '34 ABC 123',
);

OdometerReading reading(
  String id,
  int km,
  int day, {
  String vehicleId = 'car',
}) => OdometerReading(
  id: id,
  vehicleId: vehicleId,
  km: km,
  readOn: DateTime.utc(2026, 10, day),
);

ServiceRecord service({
  String id = 'maintenance',
  int? km = 65000,
  DateTime? date,
  bool reset = true,
  int cost = 0,
  List<ServicePart> parts = const [],
}) => ServiceRecord(
  id: id,
  vehicleId: 'car',
  performedOn: date ?? DateTime.utc(2026, 1, 31),
  title: 'Periyodik bakım',
  km: km,
  resetsInterval: reset,
  totalCostKurus: cost,
  parts: parts,
);

FuelEntry fuel(
  String id, {
  int day = 10,
  String station = 'station',
  String fuelType = 'benzin',
  int amount = 50000,
  int liters = 10000,
  int? km,
}) => FuelEntry(
  id: id,
  vehicleId: 'car',
  filledAt: DateTime.utc(2026, 10, day, 9),
  fuelType: fuelType,
  litersMilli: liters,
  amountKurus: amount,
  unitPriceKurus: amount * 1000 ~/ liters,
  stationId: station,
  odometerKm: km,
);

void main() {
  group('date and maintenance rules', () {
    test('month addition clamps at month end, including leap years', () {
      expect(
        addCalendarMonths(DateTime.utc(2026, 1, 31), 1),
        DateTime.utc(2026, 2, 28),
      );
      expect(
        addCalendarMonths(DateTime.utc(2024, 1, 31), 1),
        DateTime.utc(2024, 2, 29),
      );
    });

    test('unknown history stays unknown without manufactured maintenance', () {
      final schedule = DomainRules.nextService(
        vehicle: vehicle,
        services: [],
        currentKm: 80000,
      );
      expect(schedule.status, ServiceStatus.unknown);
      expect(schedule.baseline, isNull);
      expect(schedule.dueKm, isNull);
      expect(schedule.dueDate, isNull);
    });

    test('maintenance with unknown km retains its calendar deadline', () {
      final schedule = DomainRules.nextService(
        vehicle: vehicle.copyWith(serviceIntervalMonths: 1),
        services: [service(km: null)],
        currentKm: 80000,
        now: DateTime.utc(2026, 2, 27, 12),
      );
      expect(schedule.dueDate, DateTime.utc(2026, 2, 28));
      expect(schedule.dueKm, isNull);
      expect(schedule.remainingDays, 1);
      expect(schedule.status, ServiceStatus.approaching);
    });

    test(
      'exact limit approaches, passed limit is overdue and gauge is bounded',
      () {
        final exact = DomainRules.nextService(
          vehicle: vehicle,
          services: [service()],
          currentKm: 80000,
          now: DateTime.utc(2026, 3, 1),
        );
        final overdue = DomainRules.nextService(
          vehicle: vehicle,
          services: [service()],
          currentKm: 80500,
          now: DateTime.utc(2026, 3, 1),
        );
        expect(exact.status, ServiceStatus.approaching);
        expect(exact.atLimit, isTrue);
        expect(overdue.status, ServiceStatus.overdue);
        expect(overdue.remainingKm, -500);
        expect(overdue.progress, 1.0);
      },
    );

    test('both limits report their own progress; the nearer one leads', () {
      // Baseline 31 Jan 2026 at 65.000 km, 15.000 km / 12 months.
      final byKm = DomainRules.nextService(
        vehicle: vehicle,
        services: [service()],
        currentKm: 77000,
        now: DateTime.utc(2026, 4, 30),
      );
      expect(byKm.kmProgress, closeTo(12000 / 15000, 0.00001));
      expect(byKm.timeProgress, closeTo(89 / 365, 0.00001));
      expect(byKm.limitedByKm, isTrue);
      final byTime = DomainRules.nextService(
        vehicle: vehicle,
        services: [service()],
        currentKm: 66000,
        now: DateTime.utc(2026, 12, 31),
      );
      expect(byTime.limitedByKm, isFalse);
      final kmUnknown = DomainRules.nextService(
        vehicle: vehicle,
        services: [service(km: null)],
        currentKm: 66000,
        now: DateTime.utc(2026, 4, 30),
      );
      expect(kmUnknown.kmProgress, isNull);
      expect(kmUnknown.limitedByKm, isFalse);
      final overdue = DomainRules.nextService(
        vehicle: vehicle,
        services: [service()],
        currentKm: 81000,
        now: DateTime.utc(2026, 4, 30),
      );
      expect(overdue.kmProgress, 1.0);
    });

    test('a calendar limit already passed leads a kilometre limit just reached', () {
      // Due 31 Jan 2027 at 80.000 km; on 28 Feb 2027 the odometer reads
      // exactly 80.000. Both bounded shares are 1, but the calendar is 28 days
      // past, so it must lead: "0 km left" would hide the overdue service.
      final schedule = DomainRules.nextService(
        vehicle: vehicle,
        services: [service()],
        currentKm: 80000,
        now: DateTime.utc(2027, 2, 28, 12),
      );
      expect(schedule.status, ServiceStatus.overdue);
      expect(schedule.remainingKm, 0);
      expect(schedule.remainingDays, -28);
      expect(schedule.kmProgress, 1.0);
      expect(schedule.timeProgress, 1.0);
      expect(schedule.limitedByKm, isFalse);
    });

    test('latest resetting maintenance is the baseline, not latest repair', () {
      final schedule = DomainRules.nextService(
        vehicle: vehicle,
        services: [
          service(),
          service(id: 'recent', km: 70000, date: DateTime.utc(2026, 9, 1)),
          service(
            id: 'repair',
            km: 72000,
            date: DateTime.utc(2026, 10, 1),
            reset: false,
          ),
        ],
        currentKm: 74000,
        now: DateTime.utc(2026, 10, 23),
      );
      expect(schedule.baseline!.id, 'recent');
      expect(schedule.dueKm, 85000);
      expect(schedule.progress, closeTo(4000 / 15000, 0.00001));
    });
  });

  group('odometer rules', () {
    test('older entries do not lower current km; latest-day maximum wins', () {
      final rows = [
        reading('today1', 80000, 23),
        reading('old', 78000, 1),
        reading('today2', 80100, 23),
        reading('another', 90000, 24, vehicleId: 'other'),
      ];
      expect(DomainRules.currentKm(rows, vehicleId: 'car'), 80100);
      expect(DomainRules.currentKm([], vehicleId: 'car'), isNull);
    });

    test('conflicts report both earlier and later inconsistent readings', () {
      final conflicts = DomainRules.kilometerConflicts(
        candidate: reading('candidate', 70000, 12),
        readings: [
          reading('earlier', 71000, 10),
          reading('later', 69000, 13),
          reading('sameDay', 72000, 12),
          reading('other', 85000, 10, vehicleId: 'other'),
        ],
      );
      expect(conflicts.map((row) => row.existing.id), ['earlier', 'later']);
    });

    test('editing a source ignores its previous version, rather than itself conflicting', () {
      final candidate = reading('r', 75000, 12);
      expect(
        DomainRules.kilometerConflicts(
          candidate: candidate,
          readings: [reading('r', 95000, 11)],
        ),
        isEmpty,
      );
    });

    test(
      'derived fuel dates use Istanbul day and unknown service km is excluded',
      () {
        final late = fuel(
          'late',
          km: 80000,
        ).copyWith(filledAt: DateTime.utc(2026, 10, 22, 22));
        final log = DomainRules.odometerLog(
          fuel: [late],
          services: [service(km: null)],
        );
        expect(log, hasLength(1));
        expect(log.single.readOn, DateTime.utc(2026, 10, 23));
        expect(log.single.sourceType, 'fuel');
      },
    );
  });

  group('ledger and reporting', () {
    test('service parts are informational and forbidden manual sources do not double count', () {
      final ledger = DomainRules.ledger(
        fuel: [fuel('fuel')],
        services: [
          service(
            cost: 100000,
            date: DateTime.utc(2026, 10, 1),
            parts: [
              const ServicePart(id: 'part', label: 'Filtre', costKurus: 30000),
            ],
          ),
        ],
        expenses: [
          Expense(
            id: 'wash',
            vehicleId: 'car',
            spentOn: DateTime.utc(2026, 10, 1),
            category: 'wash',
            amountKurus: 10000,
            title: 'Yıkama',
          ),
          Expense(
            id: 'duplicate',
            vehicleId: 'car',
            spentOn: DateTime.utc(2026, 10, 1),
            category: 'fuel',
            amountKurus: 50000,
            title: 'Yanlış manuel yakıt',
          ),
        ],
      );
      final result = DomainRules.aggregate(
        ledger,
        ReportPeriod.containing(
          DateTime.utc(2026, 10, 23),
          ReportGranularity.month,
        ),
      );
      expect(result.totalKurus, 160000);
      expect(ledger.map((row) => row.sourceType).toSet(), {
        'fuel',
        'service',
        'expense',
      });
    });

    test('largest remainders sum to 100 deterministically', () {
      final entries = [
        for (final category in ['a', 'b', 'c'])
          LedgerEntry(
            id: category,
            vehicleId: 'car',
            date: DateTime.utc(2026, 10, 1),
            category: category,
            amountKurus: 1,
            title: category,
            sourceType: 'expense',
            sourceId: category,
          ),
      ];
      final result = DomainRules.aggregate(
        entries,
        ReportPeriod.containing(
          DateTime.utc(2026, 10, 1),
          ReportGranularity.month,
        ),
      );
      expect(result.categories.map((row) => row.percentage), [34, 33, 33]);
      expect(
        DomainRules.aggregate(
          [],
          ReportPeriod.containing(
            DateTime.utc(2026, 10, 1),
            ReportGranularity.month,
          ),
        ).totalKurus,
        0,
      );
    });

    test('weeks start Monday and may cross a year boundary', () {
      final period = ReportPeriod.containing(
        DateTime.utc(2027, 1, 1),
        ReportGranularity.week,
      );
      expect(period.start, DateTime.utc(2026, 12, 28));
      expect(period.contains(DateTime.utc(2027, 1, 3)), isTrue);
      expect(period.contains(DateTime.utc(2027, 1, 4)), isFalse);
      expect(period.previous().start, DateTime.utc(2026, 12, 21));
    });

    test('"this month" is the Turkish month, whatever the device zone', () {
      // 31 Oct 22:30 UTC is 1 Nov 01:30 in Istanbul: the ledger books a fuel
      // bought then in November, so the current month must be November too.
      final instant = DateTime.utc(2026, 10, 31, 22, 30);
      final month = ReportPeriod.current(ReportGranularity.month, now: instant);
      expect(month.start, DateTime.utc(2026, 11));
      final row = fuel('night').copyWith(filledAt: instant);
      final summary = DomainRules.aggregate(
        DomainRules.ledger(fuel: [row]),
        month,
      );
      expect(summary.totalKurus, row.amountKurus);
      expect(
        ReportPeriod.current(ReportGranularity.year, now: instant).start,
        DateTime.utc(2026),
      );
    });

    test('UTC evening fuel belongs to next Turkish reporting month', () {
      final row = fuel('boundary')
          .copyWith(filledAt: DateTime.utc(2026, 9, 30, 22));
      final ledger = DomainRules.ledger(fuel: [row]);
      final result = DomainRules.aggregate(
        ledger,
        ReportPeriod.containing(
          DateTime.utc(2026, 10, 1),
          ReportGranularity.month,
        ),
      );
      expect(result.totalKurus, 50000);
    });

    test('fuel price is weighted and fuel types remain separate', () {
      final result = DomainRules.fuelSummaries([
        fuel('large', amount: 50000, liters: 10000),
        fuel('small', amount: 10000, liters: 1000),
        fuel('gas', fuelType: 'lpg', amount: 20000, liters: 10000),
      ]);
      final petrol = result.firstWhere((row) => row.fuelType == 'benzin');
      expect(petrol.totalKurus, 60000);
      expect(petrol.totalLitersMilli, 11000);
      expect(petrol.averageUnitPriceKurus, 5455);
      expect(result, hasLength(2));
    });
  });

  test(
    'last stations distinguish branches and revisit updates order, not count',
    () {
      final stations = [
        for (var i = 0; i < 7; i++)
          Station(id: 's$i', name: 'Aynı marka şube $i'),
      ];
      final result = DomainRules.recentStations(
        stations: stations,
        vehicleId: 'car',
        fuel: [
          for (var i = 0; i < 7; i++) fuel('f$i', station: 's$i', day: i + 1),
          fuel('again', station: 's0', day: 20),
        ],
      );
      expect(result.map((row) => row.station.id), [
        's0',
        's6',
        's5',
        's4',
        's3',
      ]);
      expect(result.first.visitCount, 2);
      expect(result.first.hasLocation, isFalse);
    },
  );

  test(
    'alerts use maintenance and documents without diagnosing engine health',
    () {
      final declared = vehicle.copyWith(
        engineStatus: 'normal',
        inspectionDue: DateTime.utc(2026, 10, 1),
      );
      final result = DomainRules.alerts(
        vehicle: declared,
        services: [],
        readings: [],
        now: DateTime.utc(2026, 10, 23),
        issues: [
          const VehicleIssue(
            id: 'open',
            vehicleId: 'car',
            title: 'Yağ seviyesi',
            severity: 'critical',
          ),
          VehicleIssue(
            id: 'closed',
            vehicleId: 'car',
            title: 'Akü',
            resolvedAt: DateTime.utc(2026, 10, 1),
          ),
        ],
      );
      expect(result.first.severity, AlertSeverity.critical);
      expect(result.any((alert) => alert.sourceId == 'closed'), isFalse);
      expect(
        result.any((alert) => alert.title == 'Bakım bilgisi gerekli'),
        isTrue,
      );
      expect(declared.engineStatus, 'normal');
    },
  );

  test('receipt plates match one garage vehicle regardless of spacing', () {
    final other = vehicle.copyWith(id: 'other', plate: '35 GJ 019');
    expect(DomainRules.plateKey(' 35-gj 019 '), '35GJ019');
    expect(DomainRules.vehicleForPlate([vehicle, other], '35GJ019'), other);
    expect(DomainRules.vehicleForPlate([vehicle, other], '06 XYZ 1'), isNull);
    expect(DomainRules.vehicleForPlate([vehicle, other], ''), isNull);
    // Two profiles with one plate are ambiguous; nothing is suggested.
    final copy = other.copyWith(id: 'copy');
    expect(DomainRules.vehicleForPlate([other, copy], '35 GJ 019'), isNull);
  });

  test('document countdowns count Istanbul calendar days, not hours', () {
    // 14:00 in Istanbul on 24 October 2026.
    final now = DateTime.utc(2026, 10, 24, 11);
    expect(DomainRules.daysUntil(DateTime(2026, 11, 10), now: now), 17);
    expect(DomainRules.daysUntil(DateTime(2026, 10, 24), now: now), 0);
    // 23:00 in Istanbul is still the 24th; midnight there is the 25th.
    expect(
      DomainRules.daysUntil(
        DateTime(2026, 10, 25),
        now: DateTime.utc(2026, 10, 24, 20),
      ),
      1,
    );
    expect(
      DomainRules.daysUntil(
        DateTime(2026, 10, 25),
        now: DateTime.utc(2026, 10, 24, 21),
      ),
      0,
    );
    final insurance = DomainRules.alerts(
      vehicle: vehicle.copyWith(trafficInsuranceDue: DateTime(2026, 11, 10)),
      services: [],
      readings: [],
      now: now,
    ).firstWhere((alert) => alert.id.endsWith(':insurance'));
    expect(insurance.message, '17 gün kaldı.');
  });

  test('models serialize nested parts and retain immutable defaults', () {
    final original = service(
      parts: [
        const ServicePart(id: 'filter', label: 'Yağ filtresi', costKurus: 5000),
      ],
    );
    expect(ServiceRecord.fromJson(original.toJson()), original);
    expect(Vehicle.fromJson(vehicle.toJson()), vehicle);
    expect(() => vehicle.fuelTypes.add('lpg'), throwsUnsupportedError);
  });
}
