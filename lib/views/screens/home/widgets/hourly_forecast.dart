import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/cubit/weather_state.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/utils/extensions.dart';
import 'package:weather/views/screens/home/widgets/hourly_item.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is ForecastWeatherCoordLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else if (state is ForecastWeatherCoordSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// hourly forecast title
              const Text(AppStrings.today, style: AppTextStyle.h2),
              const SizedBox(height: 10),

              /// display hourly forecast section
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,

                  // hourly weather card
                  itemBuilder: (context, index) {
                    final forecast = state.forecastModel.list[index];
                    return HourlyItem(
                      icon: forecast.weather[0].icon.replaceAll('n', 'd'),
                      hour: forecast.dt.time,
                      temp: forecast.main.temp.round(),
                      isActive: index == 0,
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is ForecastWeatherCoordFailure) {
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
