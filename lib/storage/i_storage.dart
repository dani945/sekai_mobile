import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IStorage {
  static dynamic setValue(dynamic key, dynamic value) {
    if (value is String) {
      instance().then((pref) {
        pref.setString(key, value);
      });
      return;
    }
    if (value is bool) {
      instance().then((pref) {
        pref.setBool(key, value);
      });
      return;
    }
    if (value is double) {
      instance().then((pref) {
        pref.setDouble(key, value);
      });
      return;
    }
    if (value is int) {
      instance().then((pref) {
        pref.setInt(key, value);
      });
      return;
    }
  }

  static Future<SharedPreferences> instance() async {
    var pref = await SharedPreferences.getInstance();
    return pref;
  }

  static Future<bool> removeKey(String key) async {
    var pref = await instance();
    return await pref.remove(key);
  }

  static dynamic getValue(dynamic key) async {
    Object? ret;
    var pref = await SharedPreferences.getInstance();
    ret = pref.get(key);
    return ret;
  }

  static Future<bool> setString(dynamic key, String? value) async {
    var pref = await SharedPreferences.getInstance();
    var success = await pref.setString(key, value ?? "");
    if (kDebugMode) {
      print("Saving $key is $success");
    }
    return success;
  }

  static Future<String?> getString(dynamic key) async {
    var pref = await SharedPreferences.getInstance();
    var val = pref.getString(key);
    if (val == null) {
      return "";
    }
    return val;
  }
}
