import 'package:intl/intl.dart';

class DF {
  static DateFormat format = DateFormat("E, LLL MMMd");

  static String formatDate(DateTime t, {bool time = true, bool date = true}) {
    return (time ? DateFormat("jm").format(t) + "" : "") +
        (time && date ? " " : "") +
        (date ? DateFormat("E, LLL d, y").format(t) : "");
  }
}
