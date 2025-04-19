import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/api_consumer.dart';
import 'package:weather/api/end_point.dart';
import 'package:weather/api/errors/exception.dart';
import 'package:weather/cubit/weather_state.dart';
import 'package:weather/models/forecast_item_model.dart';
import 'package:weather/models/parent_models/current_weather_model.dart';
import 'package:weather/models/parent_models/forecast_model.dart';
import 'package:weather/services/location_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.api) : super(WeatherInitial());

  final ApiConsumer api;

  double _lat = 0.0;
  double _lon = 0.0;
  TextEditingController controller = TextEditingController();

  /// get current location
  Future<void> _initializeLocation() async {
    final location = await getLocation();
    _lat = location.latitude;
    _lon = location.longitude;
  }

  /// get current weather by coordinates
  Future<void> getCurrentWeatherByCoord() async {
    emit(CurrentWeatherCoordLoading());
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

      emit(CurrentWeatherCoordSuccess(
          currentWeather: CurrentWeatherModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(CurrentWeatherCoordFailure(error: e.errorModel.message));
    } catch (e) {
      emit(CurrentWeatherCoordFailure(error: e.toString()));
    }
  }

  /// get current weather by city name
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

  /// get forecast weather by coordinates
  Future<void> getForecastWeatherByCoord() async {
    emit(ForecastWeatherCoordLoading());
    try {
      await _initializeLocation();
      final response = await api.get(
        EndPoint.forecast,
        queryParameters: {
          ApiKey.appid: EndPoint.weatherApiKey,
          ApiKey.lat: _lat,
          ApiKey.lon: _lon,
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

  /// get forecast weather by city name
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

  /// One prediction for each day
  List<ForecastItemModel> getDailyForecastList(List<ForecastItemModel> list) {

    // map to store the daily forecast
    final Map<String, ForecastItemModel> dailyForecast = {};

    // fillter all forecast to get a one forecast to day
    // and get the forecast at 12:00:00
    for (ForecastItemModel item in list) {
      final date = item.dtTxt.split(' ')[0];
      final time = item.dtTxt.split(' ')[1];
      if (!dailyForecast.containsKey(date)) {
        dailyForecast[date] = item;
      } else {
        if (time == '12:00:00') {
          dailyForecast[date] = item;
        }
      }
    }

    // return the daily forecast as list
    return dailyForecast.values.toList();
  }
}
