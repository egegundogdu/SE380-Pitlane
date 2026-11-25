import 'dart:typed_data';

import 'attachment_files_native.dart'
    if (dart.library.js_interop) 'attachment_files_web.dart'
    as platform;

Future<String> savePrivateAttachment(
  String userId,
  String name,
  Uint8List bytes,
) => platform.saveAttachment(userId, name, bytes);
Future<void> openPrivateAttachment(String path) =>
    platform.openAttachment(path);
Future<void> clearPrivateAccount(String userId) =>
    platform.clearAccount(userId);
Future<Uint8List?> readPrivateAttachment(String path) =>
    platform.readAttachment(path);
