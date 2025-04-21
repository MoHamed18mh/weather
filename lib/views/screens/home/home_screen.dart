import 'package:flutter/material.dart';
import 'package:weather/views/core/background_gradient.dart';
import 'package:weather/views/screens/home/widgets/current_weather_display.dart';
import 'package:weather/views/screens/home/widgets/hourly_forecast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// the size of the screen
    final size = MediaQuery.sizeOf(context);

    return BackgroundGradient(
      widget: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: size.height * .08)),

          /// the current weather section
          const SliverToBoxAdapter(child: CurrentWeatherDisplay()),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          /// the hourly weather section
          const SliverToBoxAdapter(child: HourlyForecastDisplay()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
