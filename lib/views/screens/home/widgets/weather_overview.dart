import 'package:flutter/material.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/utils/extensions.dart';

class WeatherOverView extends StatelessWidget {
  const WeatherOverView({
    super.key,
    required this.name,
    required this.icon,
    required this.description,
  });

  final String name;
  final String icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        /// the name of the city
        Text(
          name,
          style: AppTextStyle.h1,
          textAlign: TextAlign.center,
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),

        /// the date and time of the weather
        Text(DateTime.now().dateTime, style: AppTextStyle.subtitleText),
        const SizedBox(height: 25),

        /// the icon that descreption the weather
        Image.asset(
          'assets/icons/$icon.png',
          height: size.height * 0.23,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 25),

        /// the description of the weather
        Text(
          description,
          style: AppTextStyle.h3,
        ),
      ],
    );
  }
}
