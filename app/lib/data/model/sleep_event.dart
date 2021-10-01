import 'package:app/util/extensions.dart';

class SleepEvent {
  final DateTime start;
  final DateTime finish;

  SleepEvent({required this.start, required this.finish});

  SleepEvent._(this.start, this.finish);

  Duration getDuration() {
    return finish.difference(start);
  }

  static SleepEvent from(DateTime start, DateTime finish) =>
      SleepEvent._(start.toUtc(), finish.toUtc());

  static SleepEvent read(String data) {
    List<String> v = data.split(":");
    return SleepEvent._(XDateTime.read(v[0]), XDateTime.read(v[1]));
  }

  String write() {
    return start.write() + ":" + finish.write();
  }
}
