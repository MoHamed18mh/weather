import 'package:weather/api/end_point.dart';

class SysModel {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  SysModel({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      type: json[ApiKey.type] ?? 0,
      id: json[ApiKey.id] ?? 0,
      country: json[ApiKey.country] ?? '',
      sunrise: json[ApiKey.sunrise] ?? 0,
      sunset: json[ApiKey.sunset] ?? 0,
    );
  }
}
