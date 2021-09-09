import 'package:app/screen/home.dart';
import 'package:app/util/data.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      theme: ThemeData.light(),
      themeMode: Data.getThemeMode(),
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
