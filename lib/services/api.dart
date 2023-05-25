import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vidaleve/services/firebase_exceptions.dart';

class Api {
  static const host = 'http://192.168.200.104/vidaleve/api';
  static late dynamic _response;

  Future get({required controller, required action}) async {
    String url = '$host/?api=$controller&action=$action';

    try {
      Uri uri = Uri.parse(url);

      _response = await http.get(uri);
    } catch (e) {
      print(e);
    }

    return _response;
  }

  Future post({required controller, required action, data}) async {
    String url = '$host/?api=$controller&action=$action';

    try {
      Uri uri = Uri.parse(url);

      _response = await http.post(uri, body: data);
    } on Exception catch (e) {
      print(e);
    }

    return _response;
  }
}
