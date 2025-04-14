import 'package:weather/api/end_point.dart';

class PodModel {
  final String pod;

  PodModel({required this.pod});

  factory PodModel.fromJson(Map<String, dynamic> json) {
    return PodModel(
      pod: json[ApiKey.pod] ?? '',
    );
  }
}