

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _phoneNumber = "phone_number";

  static late SharedPreferences _preferences;
  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setPhoneNumber(String phoneNumber) async => await _preferences.setString(_phoneNumber, phoneNumber);
  static String? getPhoneNumber() => _preferences.getString(_phoneNumber);
}