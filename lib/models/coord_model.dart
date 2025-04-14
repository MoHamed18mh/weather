import 'package:weather/api/end_point.dart';

class CoordModel {
  final double lon;
  final double lat;

  CoordModel({required this.lon, required this.lat});

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lon: json[ApiKey.lon] ?? 0.0,
      lat: json[ApiKey.lat] ?? 0.0,
    );
  }
}
