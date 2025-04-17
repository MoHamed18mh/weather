import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/cubit/weather_state.dart';
import 'package:weather/utils/app_colors.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/utils/extensions.dart';
import 'package:weather/utils/weather_icons.dart';

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
          final cubit = context.read<WeatherCubit>();
          final todayList = cubit.todyForecastList(state.forecastModel.list);

          return LayoutBuilder(builder: (context, constraints) {
            // get current scrren width
            final screenWidth = constraints.maxWidth;

            // the sum of the items width in the list view
            int itemWidth = 130 * todayList.length;

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
                  itemCount: todayList.length,
                  itemBuilder: (context, index) {
                    final forecast = todayList[index];
                    return HourlyWeatherCard(
                      id: forecast.weather[0].id,
                      hour: forecast.dt.time,
                      temp: forecast.main.temp.round(),
                    );
                  },
                ),
              ),
            );
          });
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

class HourlyWeatherCard extends StatelessWidget {
  const HourlyWeatherCard(
      {super.key, required this.id, required this.hour, required this.temp});

  final int id;
  final String hour;
  final int temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(8),
      width: 120,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            getWeatherIcon(weatherCode: id),
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                hour,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                '${temp.round()}°',
                style: AppTextStyle.h3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
