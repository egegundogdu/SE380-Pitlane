import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;

import 'private_directory.dart';

Future<String> saveAttachment(
  String userId,
  String name,
  Uint8List bytes,
) async {
  final root = await privateAccountDirectory(userId);
  final dir = Directory(p.join(root.path, 'documents'));
  await dir.create(recursive: true);
  final file = File(p.join(dir.path, p.basename(name)));
  await file.writeAsBytes(bytes, flush: true);
  return file.path;
}

Future<void> openAttachment(String path) async {
  final file = await _locate(path);
  await deviceStorageChannel.invokeMethod<void>('openDocument', {
    'path': file?.path ?? path,
  });
}

Future<void> clearAccount(String userId) => removeAccountFiles(userId);
Future<Uint8List?> readAttachment(String path) async {
  final file = await _locate(path);
  return file?.readAsBytes();
}

/// The stored path, or the same file in the current install's account
/// folder when the app container has moved since the path was saved.
Future<File?> _locate(String path) async {
  final file = File(path);
  if (await file.exists()) return file;
  final relative = accountRelativePath(path);
  if (relative == null) return null;
  try {
    final root = await privateAccountDirectory(relative.userId);
    final moved = File(p.joinAll([root.path, ...relative.parts]));
    return await moved.exists() ? moved : null;
  } catch (_) {
    // Best effort: an invalid account name or an unavailable storage
    // channel just means the file is not found here.
    return null;
  }
}
