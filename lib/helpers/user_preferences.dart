import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future<List<String>> getSession() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('tokens') ?? [];
  }

  static Future<bool> createSession(String token, String privateToken, List<String> data) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList("tokens", [token, privateToken, ...data]);
  }

  static Future<bool> destroySession() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
