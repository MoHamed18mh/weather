import 'package:weather/api/end_point.dart';

class CloudsModel {
  final int all;

  CloudsModel({required this.all});

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(
      all: json[ApiKey.all] ?? 0,
    );
  }
}
