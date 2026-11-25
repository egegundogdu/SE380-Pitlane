import 'dart:typed_data';

Future<String> saveAttachment(
  String userId,
  String name,
  Uint8List bytes,
) async => throw UnsupportedError(
  'Belge arşivi Android ve iOS uygulamasında kullanılabilir.',
);
Future<void> openAttachment(String path) async =>
    throw UnsupportedError('Yerel belgeyi mobil uygulamada açabilirsiniz.');
Future<void> clearAccount(String userId) async {}
Future<Uint8List?> readAttachment(String path) async => null;
