import 'package:dio/dio.dart';
import 'package:weather/api/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleException(DioException e) {
  if (e.response != null && e.response!.data != null) {
    throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
  } else {
    throw ServerException(
      errorModel: ErrorModel(
        cod: '0',
        message: e.message ?? 'Unknown error',
      ),
    );
  }
}
