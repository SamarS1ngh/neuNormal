// A class for handling local storage operations using shared preferences.
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // Asynchronous method to retrieve a string value from local storage by a given key.
  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Asynchronous method to set a string value in local storage with a given key.
  static Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Asynchronous method to retrieve a boolean value from local storage by a given key.
  static Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  // Asynchronous method to set a boolean value in local storage with a given key.
  static Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  // Asynchronous method to retrieve an integer value from local storage by a given key.
  static Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  // Asynchronous method to set an integer value in local storage with a given key.
  static Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  // Asynchronous method to retrieve a double value from local storage by a given key.
  static Future<double?> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  // Asynchronous method to set a double value in local storage with a given key.
  static Future<void> setDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  // Asynchronous method to retrieve a list of strings from local storage by a given key.
  static Future<List<String>?> getStringList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  // Asynchronous method to set a list of strings in local storage with a given key.
  static Future<void> setStringList(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  // Asynchronous method to remove a value from local storage by a given key.
  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // Asynchronous method to clear all values from local storage.
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
