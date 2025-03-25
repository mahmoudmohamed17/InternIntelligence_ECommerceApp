import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences instance;
  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await instance.setBool(key, value);
  }

  static bool getBool(String value) {
    return instance.getBool(value) ?? false;
  }
}
