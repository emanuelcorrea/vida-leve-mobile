import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Authentication {
  Future login({
    required String email,
    required String password
  }) async {
    var url = Uri.http('192.168.7.116', 'vlu/api/?api=usuario&action=login');
    var response = await http.post(url, body: { 'email': email, 'password': password });
    // print(response);
    return response;
  }
}