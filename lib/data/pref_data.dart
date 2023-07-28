import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String darkMode = 'darkMode';

  static setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkMode, value);
  }

  static Future<bool> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkMode) ?? false;
  }
}


