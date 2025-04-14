import 'package:weather/api/end_point.dart';
import 'package:weather/models/clouds_model.dart';
import 'package:weather/models/coord_model.dart';
import 'package:weather/models/main_model.dart';
import 'package:weather/models/rain_model.dart';
import 'package:weather/models/sys_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/models/wind_model.dart';

class CurrentWeatherModel {
  final CoordModel coord;
  final List<WeatherModel> weather;
  final String base;
  final MainModel main;
  final int visibility;
  final WindModel wind;
  final RainModel? rain;
  final CloudsModel clouds;
  final int dt;
  final SysModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  CurrentWeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      coord: CoordModel.fromJson(json[ApiKey.coord]),
      weather: (json[ApiKey.weather] as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
      base: json[ApiKey.base] ?? '',
      main: MainModel.fromJson(json[ApiKey.main]),
      visibility: json[ApiKey.visibility] ?? 0,
      wind: WindModel.fromJson(json[ApiKey.wind]),
      rain: json[ApiKey.rain] != null
          ? RainModel.fromJson(json[ApiKey.rain])
          : null,
      clouds: CloudsModel.fromJson(json[ApiKey.clouds]),
      dt: json[ApiKey.dt] ?? 0,
      sys: SysModel.fromJson(json[ApiKey.sys]),
      timezone: json[ApiKey.timezone] ?? 0,
      id: json[ApiKey.id] ?? 0,
      name: json[ApiKey.name] ?? '',
      cod: json[ApiKey.cod] is int
          ? json[ApiKey.cod]
          : int.tryParse(json[ApiKey.cod]) ?? 0,
    );
  }
}