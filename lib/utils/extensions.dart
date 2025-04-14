import 'package:jiffy/jiffy.dart';

extension FormatDateTime on DateTime {
  String get dateTime =>
      Jiffy.parseFromDateTime(this).format(pattern: 'yMMMMd');
}

// convert date to day like 30/5/2030 => Monday
extension DayOfWeek on DateTime {
  String get dayOfWeek => Jiffy.parseFromDateTime(this).format(pattern: 'EEEE');
}

// convert string to date
extension ParseDateString on String {
  DateTime toDateTime() => DateTime.parse(this);
}

// This extension convert m/s to km/h
// m/s is the default unit for wind speed in openweathermap but we need to convert it to km/h
extension ConvertWindSpeed on double {
  String get kmh => (this * 3.6).toStringAsFixed(2);
}

// This extension convert timestamp to time
extension ConvertTimestampToTime on int {
  String get time =>
      Jiffy.parseFromMillisecondsSinceEpoch(this * 1000).format(pattern: 'Hm');

  String get dateTime => Jiffy.parseFromMillisecondsSinceEpoch(this * 1000)
      .format(pattern: 'yMMMMd');
}

// This extension capitalize the first letter of a string
extension Capitalize on String {
  String get capitalize {
    return length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
  }
}
