import 'package:shared_preferences/shared_preferences.dart';

import '../../app.dart';

class LocalStorageImpl implements LocalStorage {
  Future<SharedPreferences> get instance async =>
      await SharedPreferences.getInstance();

  @override
  Future<T?> read<T>(String key) async {
    final sp = await instance;

    if (T == String) {
      return sp.getString(key) as T?;
    } else if (T == int) {
      return sp.getInt(key) as T?;
    } else if (T == bool) {
      return sp.getBool(key) as T?;
    } else if (T == double) {
      return sp.getDouble(key) as T?;
    } else if (T == List<String>) {
      return sp.getStringList(key) as T?;
    } else {
      throw Exception('Type not supported');
    }
  }

  @override
  Future<void> save<T>(String key, T value) async {
    final sp = await instance;

    if (T == String) {
      await sp.setString(key, value as String);
    } else if (T == int) {
      await sp.setInt(key, value as int);
    } else if (T == bool) {
      await sp.setBool(key, value as bool);
    } else if (T == double) {
      await sp.setDouble(key, value as double);
    } else if (T == List<String>) {
      sp.setStringList(key, value as List<String>);
    } else {
      throw Exception('Type not supported');
    }
  }

  @override
  Future<bool> contains(String key) async {
    final sp = await instance;
    return sp.containsKey(key);
  }

  @override
  Future<void> clear() async {
    final sp = await instance;
    await sp.clear();
  }

  @override
  Future<void> remove(String key) async {
    final sp = await instance;
    await sp.remove(key);
  }
}
