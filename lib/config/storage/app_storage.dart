import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'storage_keys.dart';

class SharedPrefsStorage {
  static final SharedPrefsStorage _instance = SharedPrefsStorage._internal();
  late SharedPreferences _prefs;

  SharedPrefsStorage._internal();

  factory SharedPrefsStorage() => _instance;

  static Future<void> init() async {
    _instance._prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String token) async =>
      await _instance._prefs.setString(StorageKeys.accessToken, token);

  static String? getToken() =>
      _instance._prefs.getString(StorageKeys.accessToken);

  static Future<void> removeToken() async =>
      await _instance._prefs.remove(StorageKeys.accessToken);

  static Future<void> setRefreshToken(String token) async =>
      await _instance._prefs.setString(StorageKeys.refreshToken, token);

  static String? getRefreshToken() =>
      _instance._prefs.getString(StorageKeys.refreshToken);

  static Future<void> removeRefreshToken() async =>
      await _instance._prefs.remove(StorageKeys.refreshToken);

  static Future<void> setUserId(String id) async =>
      await _instance._prefs.setString(StorageKeys.userId, id);
  static String? getUserId() => _instance._prefs.getString(StorageKeys.userId);
  static Future<void> setUserFit(String fit) async =>
      await _instance._prefs.setString(StorageKeys.fit, fit);
  static String? getUserFit() => _instance._prefs.getString(StorageKeys.fit);

  static Future<void> setRecentSearchesList(
      List<Map<String, dynamic>> searches) async {
    final encoded = searches.map((e) => jsonEncode(e)).toList();
    await _instance._prefs.setStringList(StorageKeys.recentSearches, encoded);
  }

  static List<Map<String, dynamic>> getRecentSearchesList() {
    final encodedList =
        _instance._prefs.getStringList(StorageKeys.recentSearches);
    if (encodedList == null) return [];
    return encodedList
        .map((e) => jsonDecode(e) as Map<String, dynamic>)
        .toList();
  }

  static Future<void> removeUserId() async =>
      await _instance._prefs.remove(StorageKeys.userId);

  Future<void> set(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    }
  }

  T? get<T>(String key, {T? defaultValue}) {
    if (T == String) {
      return _prefs.getString(key) as T? ?? defaultValue;
    } else if (T == int) {
      return _prefs.getInt(key) as T? ?? defaultValue;
    } else if (T == bool) {
      return _prefs.getBool(key) as T? ?? defaultValue;
    } else if (T == double) {
      return _prefs.getDouble(key) as T? ?? defaultValue;
    }
    return defaultValue;
  }

  Future<void> remove(String key) async => await _prefs.remove(key);

  // Get the whole user object

  static Future<void> clearUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKeys.accessToken);
    await prefs.remove(StorageKeys.userId);
  }
}
