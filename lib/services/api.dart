import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Api {
  static const host = 'http://192.168.7.116/api';
  static late dynamic _response;

  getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: host,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: Headers.formUrlEncodedContentType,
    );

    return Dio(options);
  }

  Future get({
    required controller,
    required action,
  }) async {
    String url = '$host/?api=$controller&action=$action';

    try {
      Uri uri = Uri.parse(url);

      _response = await http.get(uri);
    } catch (e) {
      print(e);
    }

    return _response;
  }

  Future post({
    required controller,
    required action,
    data,
  }) async {
    final Dio dio = getDio();

    String url = '$host/?api=$controller&action=$action';

    try {
      _response = await dio.post(url, data: data);
    } on DioError catch (_) {
      print(_);
      print(_.response);
      print(_.type);
      print(_.error);
      rethrow;
    } catch (e) {
      throw ('Failed to make the request: $e');
    }

    return jsonDecode(_response.data);
  }
}
