import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? _prefs;

  // Initialize SharedPreferences once
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save data
  static Future<void> saveUserData({
    required int id,
    required bool login,
    required String utype,
    String? campid,
    String? collectionid,
    String? sessionid,
  }) async {
    await _prefs?.setInt('id', id);
    await _prefs?.setBool('login', login);
    await _prefs?.setString('utype', utype);
    if (campid != null) await _prefs?.setString('campid', campid);
    if (collectionid != null) await _prefs?.setString('collectionid', collectionid);
    if (sessionid != null) await _prefs?.setString('sessionid', sessionid);
  }

  // Retrieve data
  static int? getId() => _prefs?.getInt('id');
  static String? getCampid() => _prefs?.getString('campid');
  static String? getCollectionid() => _prefs?.getString('collectionid');
  static String? getSectionId() => _prefs?.getString('sessionid');
  static bool getLoginStatus() => _prefs?.getBool('login') ?? false;
  static String? getUtype() => _prefs?.getString('utype');
  
  // Clear data on logout
  static Future<void> clearUserData() async {
    await _prefs?.clear();
  }
}
