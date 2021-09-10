import 'package:app/util/l.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Data {
  static Future<bool> setup() async {
    if (!kIsWeb) {
      Hive.init("hive");
    }

    await Future.wait(<Future>[
      Hive.openBox("settings", path: "settings"),
      Hive.openBox("state", path: "state"),
      Hive.openBox("cache", path: "cache"),
      Hive.openBox("jwt", path: "jwt")
    ]);
    L.i("Boxes are open");
    return true;
  }

  static Box settings() {
    return Hive.box("settings");
  }

  static Box jwt() {
    return Hive.box("settings");
  }

  static Box state() {
    return Hive.box("state");
  }

  static Box cache() {
    return Hive.box("cache");
  }

  static ThemeMode getThemeMode() {
    int v = settings().get("theme", defaultValue: 0);
    return ThemeMode.values[v >= ThemeMode.values.length ? 0 : v];
  }
}
