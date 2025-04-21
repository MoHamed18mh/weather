import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/api_consumer.dart';
import 'package:weather/api/end_point.dart';
import 'package:weather/api/errors/exception.dart';
import 'package:weather/cubit/weather_city_state.dart';
import 'package:weather/models/parent_models/current_weather_model.dart';

class WeatherCityCubit extends Cubit<WeatherCityState> {
  final ApiConsumer api;
  
  WeatherCityCubit(this.api) : super(WeatherCityInitial());

  Future<void> fetchWeatherByCity(String cityName) async {
    emit(WeatherCityLoading());
    try {
      final response = await api.get(
        EndPoint.currentWeather,
        queryParameters: {
          ApiKey.appid: EndPoint.weatherApiKey,
          ApiKey.q: cityName,
          ApiKey.units: ApiKey.metric,
        },
      );

      emit(WeatherCitySuccess(
          currentWeather: CurrentWeatherModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(WeatherCityFailure(error: e.errorModel.message));
    } catch (e) {
      emit(WeatherCityFailure(error: e.toString()));
    }
  }
}
