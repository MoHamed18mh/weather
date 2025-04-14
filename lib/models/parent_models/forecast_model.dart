import 'package:weather/api/end_point.dart';
import 'package:weather/models/city_model.dart';
import 'package:weather/models/forecast_item_model.dart';

class ForecastModel {
  final String cod;
  final int message;
  final int cnt;
  final List<ForecastItemModel> list;
  final CityModel city;

  ForecastModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      cod: json[ApiKey.cod] ?? '',
      message: json[ApiKey.message] ?? 0,
      cnt: json[ApiKey.cnt] ?? 0,
      list: (json[ApiKey.list] as List)
          .map((e) => ForecastItemModel.fromJson(e))
          .toList(),
      city: CityModel.fromJson(json[ApiKey.city]),
    );
  }
}