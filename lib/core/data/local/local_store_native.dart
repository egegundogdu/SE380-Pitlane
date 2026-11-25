import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'local_store.dart';
import 'private_directory.dart';

class _Database extends GeneratedDatabase {
  _Database(super.executor);
  @override
  int get schemaVersion => 1;
  @override
  Iterable<TableInfo<Table, Object?>> get allTables => const [];
  @override
  MigrationStrategy get migration => MigrationStrategy(
    // IF NOT EXISTS: two connections opening a fresh file may both see v0.
    onCreate: (_) async {
      await customStatement(
        'CREATE TABLE IF NOT EXISTS local_entries (entry_key TEXT PRIMARY KEY, value TEXT NOT NULL, updated_at INTEGER NOT NULL)',
      );
    },
  );
}

class _SqliteLocalStore implements LocalStore {
  _SqliteLocalStore(this.database);
  final _Database database;
  @override
  Future<Map<String, dynamic>?> read(String key) async {
    final row = await database
        .customSelect(
          'SELECT value FROM local_entries WHERE entry_key = ?',
          variables: [Variable(key)],
        )
        .getSingleOrNull();
    return row == null
        ? null
        : Map<String, dynamic>.from(
            jsonDecode(row.read<String>('value')) as Map,
          );
  }

  @override
  Future<void> write(String key, Map<String, dynamic> value) =>
      database.customStatement(
        'INSERT INTO local_entries(entry_key,value,updated_at) VALUES(?,?,?) ON CONFLICT(entry_key) DO UPDATE SET value=excluded.value,updated_at=excluded.updated_at',
        [key, jsonEncode(value), DateTime.now().millisecondsSinceEpoch],
      );
  @override
  Future<void> remove(String key) => database.customStatement(
    'DELETE FROM local_entries WHERE entry_key=?',
    [key],
  );
  @override
  Future<void> clear() => database.customStatement('DELETE FROM local_entries');
  @override
  Future<void> close() => database.close();
}

Future<LocalStore> openStore(String userId) async =>
    openStoreAt(await privateAccountDirectory(userId));

LocalStore openStoreAt(Directory dir) {
  // The garage controller keeps one connection open while the receipt archive
  // opens short-lived ones to the same account file. No stream queries are
  // used, so separate instances are safe once a concurrent write waits for
  // the lock instead of failing with SQLITE_BUSY.
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  return _SqliteLocalStore(
    _Database(
      NativeDatabase.createInBackground(
        File(p.join(dir.path, 'garaj.sqlite')),
        setup: (database) {
          database.execute('PRAGMA busy_timeout = 5000');
          try {
            database.execute('PRAGMA journal_mode = WAL');
          } on SqliteException {
            // Two connections switching a fresh file at once deadlock-detect
            // instead of waiting; the other one makes the file WAL (it is
            // persistent), and busy_timeout still covers every write.
          }
        },
      ),
    ),
  );
}
