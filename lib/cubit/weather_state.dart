import 'package:weather/models/parent_models/current_weather_model.dart';
import 'package:weather/models/parent_models/forecast_model.dart';

class WeatherState {}

final class WeatherInitial extends WeatherState {}

// states of current weather by coordinates
final class CurrentWeatherCoordLoading extends WeatherState {}

final class CurrentWeatherCoordSuccess extends WeatherState {
  final CurrentWeatherModel currentWeather;
  CurrentWeatherCoordSuccess({required this.currentWeather});
}

final class CurrentWeatherCoordFailure extends WeatherState {
  final String error;
  CurrentWeatherCoordFailure({required this.error});
}

// states of current weather by city name
final class CurrentWeatherCityLoading extends WeatherState {}

final class CurrentWeatherCitySuccess extends WeatherState {
  final CurrentWeatherModel currentWeather;
  CurrentWeatherCitySuccess({required this.currentWeather});
}

final class CurrentWeatherCityFailure extends WeatherState {
  final String error;
  CurrentWeatherCityFailure({required this.error});
}

// states of forecast weather by coordinates
final class ForecastWeatherCoordLoading extends WeatherState {}

final class ForecastWeatherCoordSuccess extends WeatherState {
  final ForecastModel forecastModel;
  ForecastWeatherCoordSuccess({required this.forecastModel});
}

final class ForecastWeatherCoordFailure extends WeatherState {
  final String error;
  ForecastWeatherCoordFailure({required this.error});
}

// states of forecast weather by coordinates
final class ForecastWeatherCityLoading extends WeatherState {}

final class ForecastWeatherCitySuccess extends WeatherState {
  final ForecastModel forecastModel;
  ForecastWeatherCitySuccess({required this.forecastModel});
}

final class ForecastWeatherCityFailure extends WeatherState {
  final String error;
  ForecastWeatherCityFailure({required this.error});
}