import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static late SharedPreferences _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> cacheData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return _sharedPreferences.setString(key, value);
    if (value is bool) return _sharedPreferences.setBool(key, value);
    if (value is double) return _sharedPreferences.setDouble(key, value);
    if (value is int) return _sharedPreferences.setInt(key, value);
    return _sharedPreferences.setStringList(key, value);
  }

  static dynamic getCacheData({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<bool> removeCacheData({required key}) async {
    return await _sharedPreferences.remove(key);
  }

  static String? get token => CacheService.getCacheData(key: 'token');
}
