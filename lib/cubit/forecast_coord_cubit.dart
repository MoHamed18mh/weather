import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/api_consumer.dart';
import 'package:weather/api/end_point.dart';
import 'package:weather/api/errors/exception.dart';
import 'package:weather/cubit/forecast_coord_state.dart';
import 'package:weather/models/forecast_item_model.dart';
import 'package:weather/models/parent_models/forecast_model.dart';
import 'package:weather/services/location_service.dart';

class ForecastCoordCubit extends Cubit<ForecastCoordState> {
  final ApiConsumer api;

  ForecastCoordCubit(this.api) : super(ForecastCoordInitial());

  double _lat = 0.0;
  double _lon = 0.0;

  /// get current location
  Future<void> _initializeLocation() async {
    final location = await getLocation();
    _lat = location.latitude;
    _lon = location.longitude;
  }

  Future<void> fetchForecastByCoord() async {
    emit(ForecastCoordLoading());
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

      emit(ForecastCoordSuccess(
          forecastModel: ForecastModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(ForecastCoordFailure(error: e.errorModel.message));
    } catch (e) {
      emit(ForecastCoordFailure(error: e.toString()));
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
