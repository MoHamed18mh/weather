import 'package:weather/api/end_point.dart';
import 'package:weather/models/coord_model.dart';

class CityModel {
  final int id;
  final String name;
  final CoordModel coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  CityModel({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json[ApiKey.city] ?? 0,
      name: json[ApiKey.name] ?? '',
      coord: CoordModel.fromJson(json[ApiKey.coord]),
      country: json[ApiKey.country] ?? '',
      population: json[ApiKey.population] ?? 0,
      timezone: json[ApiKey.timezone] ?? 0,
      sunrise: json[ApiKey.sunrise] ?? 0,
      sunset: json[ApiKey.sunset] ?? 0,
    );
  }
}
