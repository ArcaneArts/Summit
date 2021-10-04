import 'package:app/data/data.dart';
import 'package:app/view/application.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'main.config.dart';

final gx = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(gx, environment: 'dev');

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Data.setup()
      .then((_) => configureDependencies())
      .then((_) => runApp(SummitApplication()));
}