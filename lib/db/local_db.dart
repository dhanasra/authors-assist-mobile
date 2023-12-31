import 'package:hive_flutter/hive_flutter.dart';

class LocalDB {

  static final box = Hive.box('crdenticals');
  static final settingsBox = Hive.box('crdenticals');

  static saveAccessToken(value)=>box.put('accessToken', value);
  static saveRefreshToken(value)=>box.put('refreshToken', value);
  static getAccessToken()=>box.get('accessToken');
  static getRefreshToken()=>box.get('refreshToken');

  static saveTheme(value)=>box.put('theme', value);
  static getTheme()=>box.get('theme');

  static clearDB()=>box.clear();

}