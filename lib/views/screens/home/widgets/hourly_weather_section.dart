import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/cubit/weather_state.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/utils/extensions.dart';
import 'package:weather/views/screens/home/widgets/hourly_weather_card.dart';

class HourlyWeatherSection extends StatelessWidget {
  const HourlyWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is ForecastWeatherCoordLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else if (state is ForecastWeatherCoordSuccess) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // get current scrren width
              final screenWidth = constraints.maxWidth;

              // the sum of the items width in the list view
              int itemWidth = 130 * 8;

              // calculate the padding to center the list view
              // if the item width is greater than the screen width, set it to 0
              final horizontalPadding =
                  ((screenWidth - itemWidth) / 2).clamp(0.0, double.infinity);

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,

                    // hourly weather card
                    itemBuilder: (context, index) {
                      final forecast = state.forecastModel.list[index];
                      return HourlyWeatherCard(
                        id: forecast.weather[0].id,
                        hour: forecast.dt.time,
                        temp: forecast.main.temp.round(),
                        isActive: index == 0,
                      );
                    },
                  ),
                ),
              );
            },
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
