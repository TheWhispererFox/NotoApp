extension DateTimeExtension on DateTime {
  DateTime asUtc() {
    return DateTime.utc(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }
}

DateTime nowUtc() => DateTime.now().asUtc();
