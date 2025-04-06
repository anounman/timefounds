import 'package:shared_preferences/shared_preferences.dart';

import '../config/storage_key.dart';

class LocalStorageService {
  LocalStorageService(this._prefs);
  final SharedPreferences _prefs;

  Future<void> setString(StorageKey key, String value) async {
    await _prefs.setString(key.key, value);
  }

  String? getString(StorageKey key) {
    return _prefs.getString(key.key);
  }

  Future<void> remove(StorageKey key) async {
    await _prefs.remove(key.key);
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
