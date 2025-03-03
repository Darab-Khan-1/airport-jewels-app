import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model/login_model.dart';

const String authTokenKey = 'AUTH_TOKEN';
const String _loginModelKey = 'login_model';

/// Singleton class to manage SharedPreferences
class SharedPrefsRepository {
  // Singleton instance
  static final SharedPrefsRepository _instance =
      SharedPrefsRepository._internal();

  factory SharedPrefsRepository() => _instance;

  SharedPrefsRepository._internal();

  late final SharedPreferences _prefs;

  /// Initialize the SharedPreferences instance
  static Future<void> initialize() async {
    _instance._prefs = await SharedPreferences.getInstance();
  }


  Future<void> saveLoginModel(LoginModel loginModel) async {
    String jsonString = jsonEncode(loginModel.toJson());
    await setAuthToken(loginModel.data?.token ?? "");
    await _prefs.setString(_loginModelKey, jsonString);

  }
  /// Retrieve LoginModel from SharedPreferences
  Future<LoginModel?> getLoginModel() async {
    String? jsonString = _prefs.getString(_loginModelKey);

    Map<String, dynamic> jsonData = jsonDecode(jsonString ?? '{}');
    return LoginModel.fromJson(jsonData);
  }


  // --- Authentication Token ---
  String? get authToken => _prefs.getString(authTokenKey);

  Future<void> setAuthToken(String token) async {
    assert(token.isNotEmpty, 'Token cannot be empty');
    await _prefs.setString(authTokenKey, token);
  }


  Future<String> getAuthToken() async {
    return _prefs.getString(authTokenKey) ?? '';
  }

  Future<void> removeAuthToken() async => await _prefs.remove(authTokenKey);


  // --- Clear User Data ---
  Future<void> clearUserData() async {
    await Future.wait([
      removeAuthToken(),
      _prefs.clear()

    ]);
  }
}
