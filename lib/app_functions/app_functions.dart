import 'package:shared_preferences/shared_preferences.dart';

class fun {
  Future<int?> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id');
  }

  Future<String?> getCampid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('campid');
  }

  Future<String?> getCollectionid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('collectionid');
  }

  Future<String?> getSectionId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionid');
  }
}
