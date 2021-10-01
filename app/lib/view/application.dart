import 'package:app/data/data.dart';
import 'package:app/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummitApplication extends StatelessWidget {
  const SummitApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
      theme: ThemeData.light(),
      themeMode: Data.getThemeMode(),
      darkTheme: ThemeData.dark(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
      ]
  );
}
