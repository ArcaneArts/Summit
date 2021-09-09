import 'package:app/data/sleep_event.dart';
import 'package:app/screen/home.dart';
import 'package:app/util/data.dart';
import 'package:app/util/l.dart';
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
    L.i(SleepEvent.from(DateTime.now(), DateTime.now().add(Duration(hours: 6)))
        .write());
    L.i(SleepEvent.read(SleepEvent.from(
                DateTime.now(), DateTime.now().add(Duration(hours: 6)))
            .write())
        .write());
    return MaterialApp(
      theme: ThemeData.light(),
      themeMode: Data.getThemeMode(),
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
