import 'dart:convert';
import 'dart:developer';
import 'package:oly_elazm/features/praying/data/praying_model/timings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static  SharedPreferences? _sharedPreferences;
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();
  // initialization of the SharedPrefHelper
  static Future<void> init() async {
     _sharedPreferences = await SharedPreferences.getInstance();
  }
  /// Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    log('SharedPrefHelper : data with key : $key has been removed');
    await _sharedPreferences?.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    log('SharedPrefHelper : all data has been cleared');
    await _sharedPreferences?.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static setData(String key, value) async {
    log("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case String:
        await _sharedPreferences?.setString(key, value);
        break;
      case int:
        await _sharedPreferences?.setInt(key, value);
        break;
      case bool:
        await _sharedPreferences?.setBool(key, value);
        break;
      case double:
        await _sharedPreferences?.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool(String key)  {
    log('SharedPrefHelper : getBool with key : $key');
    return _sharedPreferences?.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble(String key)  {
    log('SharedPrefHelper : getDouble with key : $key');
    return _sharedPreferences?.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt(String key)  {
    log('SharedPrefHelper : getInt with key : $key');
    return _sharedPreferences?.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static String getString(String key)  {
    log('SharedPrefHelper : getString with key : $key');
    return _sharedPreferences?.getString(key) ?? '';
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    await _sharedPreferences?.setString(key, base64.encode(utf8.encode(value)));

    // const flutterSecureStorage = FlutterSecureStorage();
    // log("FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    // await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString(String key)  {
   final secureString= _sharedPreferences?.getString(key) ?? '';
   return utf8.decode(base64.decode(secureString));
  }
  /// Save any object to SharedPreferences
  static Future<void> setDataObject<T>({required String key,required T value}) async {
    log("SharedPrefHelper : setDataObject with key : $key and value : $value");

    String jsonString = json.encode(value is Timings ? value.toJson() : value);
    await _sharedPreferences?.setString(key, jsonString);
  }

  /// Retrieve any object from SharedPreferences
  static T? getDataObject<T>(
      {required String key,required T Function(Map<String, dynamic>) fromJson}) {
    log('SharedPrefHelper : getDataObject with key : $key');
    String? jsonString = _sharedPreferences?.getString(key);

    if (jsonString == null || jsonString.isEmpty) return null;

    try {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return fromJson(jsonMap);
    } catch (e) {
      log('SharedPrefHelper : Error decoding JSON - $e');
      return null;
    }
  }

}
