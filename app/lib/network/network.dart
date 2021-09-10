import 'package:app/util/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Network {
  static const FlutterSecureStorage? _SECURE =
      kIsWeb ? null : FlutterSecureStorage();
  static const bool _HTTPS = false;
  static const String _ADDRESS = "localhost";
  static const int _PORT = 8080;
  static const String _URL = "http${_HTTPS ? 's' : ''}://$_ADDRESS:$_PORT";
  static void write(String key, String value) async => kIsWeb
      ? Data.jwt().put(key, value)
      : _SECURE!.write(key: key, value: value);
  static Future<void> delete(String key) async =>
      kIsWeb ? Data.jwt().delete(key) : _SECURE!.delete(key: key);
  static Future<String?> read(String key) async =>
      kIsWeb ? Data.jwt().get(key) : _SECURE!.read(key: key);
}
