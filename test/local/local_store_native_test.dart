import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:garaj/core/data/local/local_store_native.dart';

void main() {
  test(
    'garage and receipt connections write the same account file concurrently',
    () async {
      final dir = await Directory.systemTemp.createTemp('garaj_store_');
      addTearDown(() => dir.delete(recursive: true));
      // Mirrors the long-lived controller store plus a receipt archive store,
      // both opening a fresh file at the same time.
      final garage = openStoreAt(dir);
      final receipts = openStoreAt(dir);
      addTearDown(receipts.close);
      addTearDown(garage.close);
      await Future.wait([
        for (var i = 0; i < 40; i++) ...[
          garage.write('garage', {'revision': i}),
          receipts.write('receipt:$i', {'id': i}),
        ],
      ]);
      expect((await receipts.read('garage'))?['revision'], isA<int>());
      for (var i = 0; i < 40; i++) {
        expect((await garage.read('receipt:$i'))?['id'], i);
      }
    },
  );
}
