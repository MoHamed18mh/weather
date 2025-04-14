import 'package:weather/api/end_point.dart';

class WeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json[ApiKey.id] ?? 0,
      main: json[ApiKey.main] ?? '',
      description: json[ApiKey.description] ?? '',
      icon: json[ApiKey.icon] ?? '',
    );
  }
}
