import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/dio_consumer.dart';
import 'package:weather/cubit/forecast_coord_cubit.dart';
import 'package:weather/cubit/weather_coord_cubit.dart';
import 'package:weather/views/core/persistent_bottom_nav_bar.dart';

void main() {
  final api = DioConsumer(dio: Dio());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WeatherCoordCubit(api)..fetchWeatherByCoord(),
        ),
        BlocProvider(
          create: (_) => ForecastCoordCubit(api)..fetchForecastByCoord(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather app',
      home: PersistentBottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
