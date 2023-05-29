import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vidaleve/interfaces/auth_exception.dart';
import 'package:vidaleve/services/api.dart';
import 'package:vidaleve/interfaces/authentication_exceptions.dart';
import 'package:vidaleve/utils/response_handler.dart';

class Authentication {
  static final Api _api = Api();
  static late dynamic _response;

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      _response = await _api.post(
        controller: 'auth',
        action: 'login',
        data: {
          'email': email,
          'password': password,
        },
      );
    } on DioError catch (e) {
      final RequestStatus status =
          AuthenticationException.handleRequestException(e.type);

      throw ResponseHandler(status);
    }

    return _response;
  }

  Future createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var response =
          await _api.post(controller: 'auth', action: 'createAccount', data: {
        'name': name,
        'email': email,
        'password': password,
      });

      _response = jsonDecode(response.body);
    } on AuthException catch (e) {
      _response = AuthenticationException.handleAuthException(e);
    }
    return _response;
  }

  Future resetPassword({
    required String email,
    required String code,
  }) async {
    try {
      _response = await _api.post(
        controller: 'auth',
        action: 'resetPassword',
        data: {
          'email': email,
          'code': code,
        },
      );
    } on DioError catch (e) {
      final RequestStatus status =
          AuthenticationException.handleRequestException(e.type);

      throw ResponseHandler(status);
    }
    return _response;
  }

  Future changePassword({
    required String email,
    required String password,
  }) async {
    try {
      _response =
          await _api.post(controller: 'auth', action: 'changePassword', data: {
        'email': email,
        'password': password,
      });
    } on DioError catch (e) {
      final RequestStatus status =
          AuthenticationException.handleRequestException(e.type);

      throw ResponseHandler(status);
    } on AuthException catch (e) {
      _response = AuthenticationException.handleAuthException(e);
    }

    return _response;
  }
}
