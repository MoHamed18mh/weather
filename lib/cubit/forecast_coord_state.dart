import 'package:weather/models/parent_models/forecast_model.dart';

class ForecastCoordState {}

final class ForecastCoordInitial extends ForecastCoordState {}

final class ForecastCoordLoading extends ForecastCoordState {}

final class ForecastCoordSuccess extends ForecastCoordState {
  final ForecastModel forecastModel;
  ForecastCoordSuccess({required this.forecastModel});
}

final class ForecastCoordFailure extends ForecastCoordState {
  final String error;
  ForecastCoordFailure({required this.error});
}
