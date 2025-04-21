import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_coord_cubit.dart';
import 'package:weather/cubit/weather_coord_state.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/utils/extensions.dart';
import 'package:weather/views/screens/home/widgets/weather_info.dart';
import 'package:weather/views/screens/home/widgets/weather_overview.dart';

class CurrentWeatherDisplay extends StatelessWidget {
  const CurrentWeatherDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCoordCubit, WeatherCoordState>(
      builder: (context, state) {
        if (state is WeatherCoordLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else if (state is WeatherCoordSuccess) {
          return Column(
            children: [
              /// the main details about weather
              WeatherOverView(
                name: state.currentWeather.name,
                icon: state.currentWeather.weather[0].icon.replaceAll('n', 'd'),
                description: state.currentWeather.weather[0].description,
              ),
              const SizedBox(height: 30),

              /// the temperature and the wind speed and the humidity
              WeatherInfo(
                temp: '${state.currentWeather.main.temp} °C',
                windSpeed: '${state.currentWeather.wind.speed.kmh} km/h',
                humidity: '${state.currentWeather.main.humidity} %',
              ),
            ],
          );
        } else if (state is WeatherCoordFailure) {
          return Center(
            child: Text(
              state.error,
              style: AppTextStyle.h2.copyWith(color: Colors.white),
            ),
          );
        } else {
          return const Center(
            child: Text(
              AppStrings.error,
              style: AppTextStyle.error,
            ),
          );
        }
      },
    );
  }
}
