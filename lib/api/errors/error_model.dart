import 'package:weather/api/end_point.dart';

class ErrorModel {
  final String cod;
  final String message;

  ErrorModel({required this.cod, required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      cod: json[ApiKey.cod],
      message: json[ApiKey.message],
    );
  }
}
