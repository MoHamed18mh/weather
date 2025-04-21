import 'package:weather/models/parent_models/current_weather_model.dart';

class WeatherCityState {}

final class WeatherCityInitial extends WeatherCityState {}

final class WeatherCityLoading extends WeatherCityState {}

final class WeatherCitySuccess extends WeatherCityState {
  final CurrentWeatherModel currentWeather;
  WeatherCitySuccess({required this.currentWeather});
}

final class WeatherCityFailure extends WeatherCityState {
  final String error;
  WeatherCityFailure({required this.error});
}
