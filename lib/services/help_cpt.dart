import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vidaleve/services/api.dart';
import 'package:vidaleve/interfaces/authentication_exceptions.dart';
import 'package:vidaleve/utils/response_handler.dart';

class HelpGptService {
  static final Api _api = Api();
  static late dynamic _response;

  Future ask(List<dynamic> context) async {
    print(jsonEncode(context));
    
    try {
      _response = await _api.post(
        controller: 'help_gpt',
        action: 'ask',
        data: {
          'context': jsonEncode(context),
        },
      );
    } on DioError catch (e) {
      final RequestStatus status =
          AuthenticationException.handleRequestException(e.type);

      throw ResponseHandler(status);
    }

    return _response;
  }
}
