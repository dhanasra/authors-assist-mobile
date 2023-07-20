import 'package:hive_flutter/hive_flutter.dart';

class LocalDB {

  static final box = Hive.box('crdenticals');

  static Future saveAccessToken(value)=>box.put('accessToken', value);
  static saveRefreshToken(value)=>box.put('refreshToken', value);
  static getAccessToken()=>box.get('accessToken');
  static getRefreshToken()=>box.get('refreshToken');

}