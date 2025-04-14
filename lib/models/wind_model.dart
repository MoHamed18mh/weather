import 'package:weather/api/end_point.dart';

class WindModel {
  final double speed;
  final int deg;
  final double gust;

  WindModel({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: (json[ApiKey.speed] as num?)?.toDouble() ?? 0.0,
      deg: json[ApiKey.deg] ?? 0,
      gust: (json[ApiKey.gust] as num?)?.toDouble() ?? 0.0,
    );
  }
}