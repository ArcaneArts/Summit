extension XDateTime on DateTime {
  /// Returns the current time in Milliseconds
  /// This returns epoch time, so it's always UTC
  int ms() {
    return millisecondsSinceEpoch;
  }

  /// Returns the date for UTC Epoch Milliseconds
  /// To use this in a formatter you will need to use .toLocal()
  static DateTime fromMs(int utc) {
    return DateTime.fromMillisecondsSinceEpoch(utc, isUtc: true);
  }

  String write() {
    return ms().toRadixString(36);
  }

  static DateTime read(String b36) {
    return fromMs(int.parse(b36, radix: 36));
  }
}

extension XDuration on Duration {
  int ms() {
    return inMilliseconds;
  }

  static Duration fromMs(int durationInMilliseconds) {
    return Duration(milliseconds: durationInMilliseconds);
  }
}
