

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _token = "_token";

  static const _phoneNumber = "_phoneNumber";
  static const _name = "_name";
  static const _username = "_username";
  static const _signature = "_signature";
  static const _createTime = "_createTime";
  static const _updateTime = "_updateTime";
  static const _lastLoginTime = "_lastLoginTime";


  static late SharedPreferences _preferences;
  static Future init() async => _preferences = await SharedPreferences.getInstance();

  //  存储登录token
  static Future setToken(String token) async => _preferences.setString(_token, token);
  static String? getToken() => _preferences.getString(_token);

  //  存储登录页手机号码
  static Future setPhoneNumber(String phoneNumber) async => await _preferences.setString(_phoneNumber, phoneNumber);
  static String? getPhoneNumber() => _preferences.getString(_phoneNumber);

  static Future setName(String name) async => await _preferences.setString(_name, name);
  static String? getName() => _preferences.getString(_name);

  static Future setUsername(String username) async => await _preferences.setString(_username, username);
  static String? getUsername() => _preferences.getString(_username);

  static Future setUpdateTime(String updateTime) async => await _preferences.setString(_updateTime, updateTime);
  static String? getUpdateTime() => _preferences.getString(_updateTime);

  static Future setCreateTime(String createTime) async => await _preferences.setString(_createTime, createTime);
  static String? getCreateTime() => _preferences.getString(_createTime);

  static Future setSignature(String signature) async => await _preferences.setString(_signature, signature);
  static String? getSignature() => _preferences.getString(_signature);

  static Future setLastLoginTime(String lastLoginTime) async => await _preferences.setString(_lastLoginTime, lastLoginTime);
  static String? getLastLoginTime() => _preferences.getString(_lastLoginTime);
}