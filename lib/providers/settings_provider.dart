import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidaleve/model/user.dart';

class SettingsProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  late dynamic _user;
  late bool _isLoading;

  dynamic get user => _user;

  dynamic get isLoading => _isLoading;

  SettingsProvider() {
    _isLoading = false;
    _user = null;

    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
  }

  Future<void> _startPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _readUser() {
    String? user = _prefs.getString('user');

    _user = user != '' ? User.fromJson(jsonDecode(user!)) : null;
    notifyListeners();
  }

  setUser(String user) async {
    await _prefs.setString('user', user);

    await _readUser();
  }

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
