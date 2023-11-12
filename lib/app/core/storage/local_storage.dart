abstract interface class LocalStorage {
  Future<T?> read<T>(String key);
  Future<void> save<T>(String key, T value);
  Future<bool> contains(String key);
  Future<void> clear();
  Future<void> remove(String key);
}
