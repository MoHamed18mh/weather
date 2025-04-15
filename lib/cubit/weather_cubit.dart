import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/api_consumer.dart';
import 'package:weather/api/end_point.dart';
import 'package:weather/api/errors/exception.dart';
import 'package:weather/models/parent_models/current_weather_model.dart';
import 'package:weather/models/parent_models/forecast_model.dart';
import 'package:weather/services/location_service.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.api) : super(WeatherInitial());

  final ApiConsumer api;

  double lat = 0.0;
  double lon = 0.0;

  // get current location
  Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  // get current weather by coordinates
  Future<void> getCurrentWeatherByCoord() async {
    emit(CurrentWeatherCoordLoading());
    try {
      await fetchLocation();
      final response = await api.get(
        EndPoint.currentWeather,
        queryParameters: {
          ApiKey.appid: EndPoint.weatherApiKey,
          ApiKey.lat: lat,
          ApiKey.lon: lon,
          ApiKey.units: ApiKey.metric,
        },
      );

      emit(CurrentWeatherCoordSuccess(
          currentWeather: CurrentWeatherModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(CurrentWeatherCoordFailure(error: e.errorModel.message));
    } catch (e) {
      emit(CurrentWeatherCoordFailure(error: e.toString()));
    }
  }

  // get current weather by city name
  Future<void> getCurrentWeatherByCityName(String cityName) async {
    emit(CurrentWeatherCityLoading());
    try {
      final response = await api.get(
        EndPoint.currentWeather,
        queryParameters: {
          ApiKey.appid: EndPoint.weatherApiKey,
          ApiKey.q: cityName,
          ApiKey.units: ApiKey.metric,
        },
      );

      emit(CurrentWeatherCitySuccess(
          currentWeather: CurrentWeatherModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(CurrentWeatherCoordFailure(error: e.errorModel.message));
    } catch (e) {
      emit(CurrentWeatherCoordFailure(error: e.toString()));
    }
  }

  // get forecast weather by coordinates
  Future<void> getForecastWeatherByCoord() async {
    emit(ForecastWeatherCoordLoading());
    try {
      await fetchLocation();
      final response = await api.get(
        EndPoint.forecast,
        queryParameters: {
          ApiKey.appid: EndPoint.weatherApiKey,
          ApiKey.lat: lat,
          ApiKey.lon: lon,
          ApiKey.units: ApiKey.metric,
        },
      );

      emit(ForecastWeatherCoordSuccess(
          forecastModel: ForecastModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(ForecastWeatherCoordFailure(error: e.errorModel.message));
    } catch (e) {
      emit(ForecastWeatherCoordFailure(error: e.toString()));
    }
  }

  // get forecast weather by city name
  Future<void> getForecastWeatherByCityName(String cityName) async {
    emit(ForecastWeatherCityLoading());
    try {
      final response = await api.get(
        EndPoint.forecast,
        queryParameters: {
          ApiKey.appid: EndPoint.weatherApiKey,
          ApiKey.q: cityName,
          ApiKey.units: ApiKey.metric,
        },
      );

      emit(ForecastWeatherCitySuccess(
          forecastModel: ForecastModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(ForecastWeatherCityFailure(error: e.errorModel.message));
    } catch (e) {
      emit(ForecastWeatherCityFailure(error: e.toString()));
    }
  }
}
