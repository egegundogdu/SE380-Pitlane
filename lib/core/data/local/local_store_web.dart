import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'local_store.dart';

// Browser storage is for the explicit development preview. Mobile uses SQLite.
class BrowserLocalStore implements LocalStore {
  BrowserLocalStore(this.userId, this.preferences);
  final String userId;
  final SharedPreferences preferences;
  String _key(String key) => 'garaj:$userId:$key';
  @override
  Future<Map<String, dynamic>?> read(String key) async {
    final raw = preferences.getString(_key(key));
    return raw == null
        ? null
        : Map<String, dynamic>.from(jsonDecode(raw) as Map);
  }

  @override
  Future<void> write(String key, Map<String, dynamic> value) async {
    await preferences.setString(_key(key), jsonEncode(value));
  }

  @override
  Future<void> remove(String key) async {
    await preferences.remove(_key(key));
  }

  @override
  Future<void> clear() async {
    for (final key
        in preferences
            .getKeys()
            .where((key) => key.startsWith('garaj:$userId:'))
            .toList()) {
      await preferences.remove(key);
    }
  }

  @override
  Future<void> close() async {}
}

Future<LocalStore> openStore(String userId) async =>
    BrowserLocalStore(userId, await SharedPreferences.getInstance());
