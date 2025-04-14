import 'package:weather/api/end_point.dart';

class RainModel {
  final double? oneHour;
  final double? threeHour;

  RainModel({this.oneHour, this.threeHour});

  factory RainModel.fromJson(Map<String, dynamic> json) {
    return RainModel(
      oneHour: (json[ApiKey.oneHour] as num?)?.toDouble(),
      threeHour: (json[ApiKey.threeHour] as num?)?.toDouble(),
    );
  }
}
