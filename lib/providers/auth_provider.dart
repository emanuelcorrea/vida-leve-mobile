import 'dart:math';

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  late String _token;
  late String _forgottenEmail;

  String get token => _token;
  String get forgottenEmail => _forgottenEmail;

  AuthProvider() {
    _token = '';
    _forgottenEmail = '';
  }

  generateToken() {
    final code = 100000 + Random().nextInt(999999);

    _token = code.toString();
    notifyListeners();
  }

  changeForgottenEmail(String email) {
    _forgottenEmail = email;
    notifyListeners();
  }
}
