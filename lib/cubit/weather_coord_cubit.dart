import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/api_consumer.dart';
import 'package:weather/api/end_point.dart';
import 'package:weather/api/errors/exception.dart';
import 'package:weather/cubit/weather_coord_state.dart';
import 'package:weather/models/parent_models/current_weather_model.dart';
import 'package:weather/services/location_service.dart';

class WeatherCoordCubit extends Cubit<WeatherCoordState> {
  final ApiConsumer api;

  WeatherCoordCubit(this.api) : super(WeatherCoordInitial());

  double _lat = 0.0;
  double _lon = 0.0;

  /// get current location
  Future<void> _initializeLocation() async {
    final location = await getLocation();
    _lat = location.latitude;
    _lon = location.longitude;
  }

  /// get current weather by coordinates
  Future<void> fetchWeatherByCoord() async {
    emit(WeatherCoordLoading());
    try {
      await _initializeLocation();
      final response = await api.get(
        EndPoint.currentWeather,
        queryParameters: {
          ApiKey.appid: EndPoint.weatherApiKey,
          ApiKey.lat: _lat,
          ApiKey.lon: _lon,
          ApiKey.units: ApiKey.metric,
        },
      );

      emit(WeatherCoordSuccess(
          currentWeather: CurrentWeatherModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(WeatherCoordFailure(error: e.errorModel.message));
    } catch (e) {
      emit(WeatherCoordFailure(error: e.toString()));
    }
  }
}
