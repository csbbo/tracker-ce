

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _phoneNumber = "_phoneNumber";
  static const _token = "_token";

  static late SharedPreferences _preferences;
  static Future init() async => _preferences = await SharedPreferences.getInstance();

  //  存储登录页手机号码
  static Future setPhoneNumber(String phoneNumber) async => await _preferences.setString(_phoneNumber, phoneNumber);
  static String? getPhoneNumber() => _preferences.getString(_phoneNumber);

  //  存储登录token
  static Future setToken(String token) async => _preferences.setString(_token, token);
  static String? getToken() => _preferences.getString(_token);
}