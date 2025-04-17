import 'package:flutter/material.dart';
import 'package:weather/utils/app_text_style.dart';

class WeatherInfoTile extends StatelessWidget {
  const WeatherInfoTile({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyle.subtitleText),
        const SizedBox(height: 6),
        Text(
          value,
          style: AppTextStyle.h3,
        ),
      ],
    );
  }
}
