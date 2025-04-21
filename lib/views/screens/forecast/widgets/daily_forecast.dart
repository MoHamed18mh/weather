import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/forecast_coord_cubit.dart';
import 'package:weather/cubit/forecast_coord_state.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/utils/extensions.dart';
import 'package:weather/views/screens/forecast/widgets/daily_item.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastCoordCubit, ForecastCoordState>(
      builder: (context, state) {
        if (state is ForecastCoordLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        } else if (state is ForecastCoordSuccess) {
          /// fillter the forecast list to get the daily forecast
          final dailyForecast = context
              .read<ForecastCoordCubit>()
              .getDailyForecastList(state.forecastModel.list);

          return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 490,
              mainAxisExtent: 90,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: dailyForecast.length,
            itemBuilder: (context, index) {
              final forecast = dailyForecast[index];

              return DailyItem(
                day: forecast.dtTxt.toDateTime().dayOfWeek,
                date: forecast.dtTxt.split(' ')[0],
                icon: forecast.weather[0].icon.replaceAll('n', 'd'),
                temp: forecast.main.temp.round().toString(),
                isActive: index == 0,
              );
            },
          );
        } else if (state is ForecastCoordFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.error,
                style: AppTextStyle.h2.copyWith(color: Colors.white),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                AppStrings.error,
                style: AppTextStyle.error,
              ),
            ),
          );
        }
      },
    );
  }
}
