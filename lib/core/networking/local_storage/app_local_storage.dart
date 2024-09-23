import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorageHelper{
  static SharedPreferences? storage;

  static initStorage() async {
    storage = await SharedPreferences.getInstance();
  }
  static const String idKey = 'idKey';

  static Future<void> setId({required int value}) async {
    await storage?.setInt(idKey, value);
  }

  static int getId() {
    return storage?.getInt(idKey) ?? 0;
  }

}