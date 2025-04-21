import 'package:flutter/material.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/views/core/background_gradient.dart';
import 'package:weather/views/screens/forecast/widgets/daily_forecast.dart';
import 'package:weather/views/screens/home/widgets/hourly_forecast.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundGradient(
      widget: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: Text(AppStrings.forecastReort, style: AppTextStyle.h1),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40)),

          // hourly forecast
          SliverToBoxAdapter(child: HourlyForecastDisplay()),
          SliverToBoxAdapter(child: SizedBox(height: 30)),

          // daily forecast
          SliverToBoxAdapter(
              child: Text(AppStrings.nextForecast, style: AppTextStyle.h2)),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          DailyForecast(),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
