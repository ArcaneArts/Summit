import 'package:app/util/df.dart';
import 'package:flutter/material.dart';

extension XDateTime on DateTime {
  /// Returns the current time in Milliseconds
  /// This returns epoch time, so it's always UTC
  int ms() => millisecondsSinceEpoch;

  /// Get the time of day from the date. This uses the current date time
  /// If it's local / utc the same will be used for time of day.
  TimeOfDay time() => TimeOfDay.fromDateTime(this);

  /// Formats this date to String converting to local time if UTC
  String format({bool time = true, bool date = true}) =>
      DF.formatDate(this, time: time, date: date);

  /// Returns the date for UTC Epoch Milliseconds
  /// To use this in a formatter you will need to use .toLocal()
  static DateTime fromMs(int utc) =>
      DateTime.fromMillisecondsSinceEpoch(utc, isUtc: true);

  String write() => ms().toRadixString(36);

  static DateTime read(String b36) => fromMs(int.parse(b36, radix: 36));
}

extension XDuration on Duration {
  int ms() => inMilliseconds;

  static Duration fromMs(int durationInMilliseconds) =>
      Duration(milliseconds: durationInMilliseconds);
}
