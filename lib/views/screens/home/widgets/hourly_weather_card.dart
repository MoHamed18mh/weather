import 'package:flutter/material.dart';
import 'package:weather/utils/app_colors.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/utils/weather_icons.dart';

class HourlyWeatherCard extends StatelessWidget {
  const HourlyWeatherCard(
      {super.key,
      required this.id,
      required this.hour,
      required this.temp,
      required this.isActive});

  final int id;
  final String hour;
  final int temp;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(8),
      width: 120,
      decoration: BoxDecoration(
        color: isActive ? AppColors.lightBlue : AppColors.accentBlue,
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
