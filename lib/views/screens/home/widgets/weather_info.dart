import 'package:flutter/material.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/views/screens/home/widgets/weather_info_tile.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.temp,
    required this.windSpeed,
    required this.humidity,
  });

  final String temp;
  final String windSpeed;
  final String humidity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WeatherInfoTile(title: AppStrings.temp, value: temp),
        WeatherInfoTile(title: AppStrings.wind, value: windSpeed),
        WeatherInfoTile(title: AppStrings.humidity, value: humidity),
      ],
    );
  }
}

