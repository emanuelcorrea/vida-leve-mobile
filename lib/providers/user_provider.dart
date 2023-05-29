import 'package:flutter/material.dart';
import 'package:vidaleve/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
