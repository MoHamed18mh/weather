import 'package:weather/api/end_point.dart';

class MainModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: (json[ApiKey.temp] as num?)?.toDouble() ?? 0.0,
      feelsLike: (json[ApiKey.feelsLike] as num?)?.toDouble() ?? 0.0,
      tempMin: (json[ApiKey.tempMin] as num?)?.toDouble() ?? 0.0,
      tempMax: (json[ApiKey.tempMax] as num?)?.toDouble() ?? 0.0,
      pressure: json[ApiKey.pressure] ?? 0,
      humidity: json[ApiKey.humidity] ?? 0,
      seaLevel: json[ApiKey.seaLevel] ?? 0,
      grndLevel: json[ApiKey.grndLevel] ?? 0,
    );
  }
}