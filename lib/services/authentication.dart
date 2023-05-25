import 'dart:convert';

import 'package:vidaleve/interfaces/auth_exception.dart';
import 'package:vidaleve/services/api.dart';
import 'package:vidaleve/services/authentication_exceptions.dart';

class Authentication {
  static final Api _api = Api();
  static late dynamic _response;

  Future login({required String email, required String password}) async {
    try {
      var response =
          await _api.post(controller: 'auth', action: 'login', data: {
        'email': email,
        'password': password,
      });

      _response = jsonDecode(response.body);
    } on AuthException catch (e) {
      _response = AuthenticationException.handleAuthException(e);
    }
    return _response;
  }
}
