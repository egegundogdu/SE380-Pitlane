import 'local_store_native.dart'
    if (dart.library.js_interop) 'local_store_web.dart'
    as platform;

abstract interface class LocalStore {
  Future<Map<String, dynamic>?> read(String key);
  Future<void> write(String key, Map<String, dynamic> value);
  Future<void> remove(String key);
  Future<void> clear();
  Future<void> close();
}

Future<LocalStore> openLocalStore(String userId) => platform.openStore(userId);
