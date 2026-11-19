import 'package:flutter_test/flutter_test.dart';
import 'package:garaj/core/domain/domain.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() {
  setUpAll(tzdata.initializeTimeZones);
  final day = DateTime(2026, 10, 20);
  final otherDay = DateTime.utc(2026, 10, 24, 9);

  for (final zone in [
    'Europe/Istanbul',
    'Asia/Dubai',
    'Asia/Tokyo',
    'Pacific/Kiritimati',
    'Europe/London',
    'America/New_York',
    'Pacific/Honolulu',
  ]) {
    test('a picked day shows and reports as that day on a phone in $zone', () {
      final device = tz.getLocation(zone);
      final moment = pickedDayMoment(day, current: otherDay, device: device);
      final onPhone = tz.TZDateTime.from(moment, device);
      expect([onPhone.year, onPhone.month, onPhone.day], [2026, 10, 20]);
      expect(istanbulDate(moment), DateTime.utc(2026, 10, 20));
    });
  }

  test('picking the day already set keeps the time of the entry', () {
    final current = DateTime.utc(2026, 10, 20, 7, 45);
    expect(
      pickedDayMoment(
        day,
        current: current,
        device: tz.getLocation('Europe/Istanbul'),
      ),
      current,
    );
  });
}
