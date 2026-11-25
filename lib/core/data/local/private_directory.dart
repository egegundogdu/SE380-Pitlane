import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

const deviceStorageChannel = MethodChannel('garaj/device_storage');

Future<Directory> privateAccountDirectory(String userId) async {
  if (!RegExp(r'^[a-zA-Z0-9_-]{1,128}$').hasMatch(userId)) {
    throw ArgumentError.value(userId, 'userId', 'Geçersiz hesap dizini');
  }
  String? base;
  if (Platform.isAndroid || Platform.isIOS) {
    base = await deviceStorageChannel.invokeMethod<String>('privateDirectory');
  }
  final dir = Directory(
    p.join(
      base ?? (await getApplicationSupportDirectory()).path,
      'accounts',
      userId,
    ),
  );
  await dir.create(recursive: true);
  if (Platform.isIOS) {
    await deviceStorageChannel.invokeMethod<void>('excludeFromBackup', {
      'path': dir.path,
    });
  }
  return dir;
}

/// The account and the path inside its folder for a file saved under
/// `…/accounts/<user>/…`, or null for any other path. iOS gives an updated
/// app a new container path, so a stored absolute path can go stale while
/// this tail still names the file.
({String userId, List<String> parts})? accountRelativePath(
  String path, {
  p.Context? context,
}) {
  final segments = (context ?? p.context).split(path);
  final index = segments.lastIndexOf('accounts');
  if (index < 0 || index + 2 >= segments.length) return null;
  final parts = segments.sublist(index + 2);
  if (parts.contains('..')) return null;
  return (userId: segments[index + 1], parts: parts);
}

Future<void> removeAccountFiles(String userId) async {
  final dir = await privateAccountDirectory(userId);
  final normalized = p.normalize(dir.absolute.path);
  if (p.basename(normalized) != userId ||
      !normalized.contains('${p.separator}accounts${p.separator}')) {
    throw StateError('Geçersiz hesap dizini');
  }
  if (await dir.exists()) await dir.delete(recursive: true);
}
