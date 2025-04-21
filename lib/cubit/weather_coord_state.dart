import 'package:weather/models/parent_models/current_weather_model.dart';

class WeatherCoordState {}

final class WeatherCoordInitial extends WeatherCoordState {}

final class WeatherCoordLoading extends WeatherCoordState {}

final class WeatherCoordSuccess extends WeatherCoordState {
  final CurrentWeatherModel currentWeather;
  WeatherCoordSuccess({required this.currentWeather});
}

final class WeatherCoordFailure extends WeatherCoordState {
  final String error;
  WeatherCoordFailure({required this.error});
}

