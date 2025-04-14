import 'package:weather/api/end_point.dart';
import 'package:weather/models/clouds_model.dart';
import 'package:weather/models/main_model.dart';
import 'package:weather/models/pod_model.dart';
import 'package:weather/models/rain_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/wind_model.dart';

class ForecastItemModel {
  final int dt;
  final MainModel main;
  final List<WeatherModel> weather;
  final CloudsModel clouds;
  final WindModel wind;
  final int visibility;
  final double pop;
  final RainModel? rain;
  final PodModel sys;
  final String dtTxt;

  ForecastItemModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.rain,
    required this.sys,
    required this.dtTxt,
  });

  factory ForecastItemModel.fromJson(Map<String, dynamic> json) {
    return ForecastItemModel(
      dt: json[ApiKey.dt] ?? 0,
      main: MainModel.fromJson(json[ApiKey.main]),
      weather: (json[ApiKey.weather] as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
      clouds: CloudsModel.fromJson(json[ApiKey.clouds]),
      wind: WindModel.fromJson(json[ApiKey.wind]),
      visibility: json[ApiKey.visibility] ?? 0,
      pop: (json[ApiKey.pop] as num?)?.toDouble() ?? 0.0,
      rain: json[ApiKey.rain] != null ? RainModel.fromJson(json[ApiKey.rain]) : null,
      sys: PodModel.fromJson(json[ApiKey.sys]),
      dtTxt: json[ApiKey.dtTxt] ?? '',
    );
  }
}