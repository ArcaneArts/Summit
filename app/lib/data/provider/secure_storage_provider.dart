import 'package:app/data/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

class SecureStorageProvider
{
  final FlutterSecureStorage? _secure = kIsWeb ? null : FlutterSecureStorage();
  void write(String key, String value) async => kIsWeb
      ? Data.jwt().put(key, value)
      : _secure!.write(key: key, value: value);
  Future<void> delete(String key) async =>
      kIsWeb ? Data.jwt().delete(key) : _secure!.delete(key: key);
  Future<String?> read(String key) async =>
      kIsWeb ? Data.jwt().get(key) : _secure!.read(key: key);
}