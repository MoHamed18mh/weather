import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/cubit/weather_state.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/utils/extensions.dart';
import 'package:weather/views/screens/home/widgets/weather_info.dart';
import 'package:weather/views/screens/home/widgets/weather_overview.dart';

class CurrentWeatherSection extends StatelessWidget {
  const CurrentWeatherSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherCoordLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else if (state is CurrentWeatherCoordSuccess) {
          return Column(
            children: [
              // the main details about weather
              WeatherOverView(
                name: state.currentWeather.name,
                icon: state.currentWeather.weather[0].icon.replaceAll('n', 'd'),
                description: state.currentWeather.weather[0].description,
              ),
              const SizedBox(height: 30),

              // the temperature and the wind speed and the humidity
              WeatherInfo(
                temp: '${state.currentWeather.main.temp} °C',
                windSpeed: '${state.currentWeather.wind.speed.kmh} km/h',
                humidity: '${state.currentWeather.main.humidity} %',
              ),
            ],
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
