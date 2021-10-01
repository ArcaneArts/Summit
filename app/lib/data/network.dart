import 'package:app/data/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Network {
  static const bool _HTTPS = false;
  static const String _ADDRESS = "localhost";
  static const int _PORT = 8080;
  static const String _URL = "http${_HTTPS ? 's' : ''}://$_ADDRESS:$_PORT";

  static Future<String?> register(
      {required String firstName,
      required String lastName,
      required String username,
      required String password}) async {
    http.Response res = await http.post(Uri.parse("$_URL/login"), body: {
      "username": username,
      "password": password,
      "firstName": firstName,
      "lastName": lastName
    });
    return res.statusCode == 200 ? res.body : null;
  }

  static Future<String?> login(String username, String password) async {
    http.Response res = await http.post(Uri.parse("$_URL/login"),
        body: {"username": username, "password": password});
    return res.statusCode == 200 ? res.body : null;
  }
}
