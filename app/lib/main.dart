import 'package:app/screen/home.dart';
import 'package:app/screen/login.dart';
import 'package:app/screen/register.dart';
import 'package:app/util/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Data.setup().then((value) => runApp(SummitApplication()));
}

class SummitApplication extends StatefulWidget {
  const SummitApplication({Key? key}) : super(key: key);

  @override
  _SummitApplicationState createState() => _SummitApplicationState();
}

class _SummitApplicationState extends State<SummitApplication> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      themeMode: Data.getThemeMode(),
      darkTheme: ThemeData.dark(),
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/login", page: () => Login()),
        GetPage(name: "/register", page: () => Register()),
      ]
    );
  }
}
