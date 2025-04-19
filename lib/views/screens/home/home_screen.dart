import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/dio_consumer.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/views/core/background_gradient.dart';
import 'package:weather/views/screens/home/widgets/current_weather_section.dart';
import 'package:weather/views/screens/home/widgets/hourly_forecast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BackgroundGradient(
      widget: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: size.height * .08)),

          // the current weather section
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => WeatherCubit(DioConsumer(dio: Dio()))
                ..getCurrentWeatherByCoord(),
              child: const CurrentWeatherSection(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // the hourly weather section
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => WeatherCubit(DioConsumer(dio: Dio()))
                ..getForecastWeatherByCoord(),
              child: const HourlyForecast(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
