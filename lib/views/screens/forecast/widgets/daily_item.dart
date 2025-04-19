import 'package:flutter/material.dart';
import 'package:weather/utils/app_colors.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/views/screens/forecast/widgets/temp_decoration.dart';

class DailyItem extends StatelessWidget {
  const DailyItem({
    super.key,
    required this.day,
    required this.date,
    required this.icon,
    required this.temp,
    required this.isActive,
  });
  final String day;
  final String date;
  final String icon;
  final String temp;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: isActive ? AppColors.lightBlue : AppColors.accentBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(day, style: AppTextStyle.h3),
              const SizedBox(height: 8),
              Text(date, style: AppTextStyle.subtitleText),
            ],
          ),
          TempDecoration(temp: temp),
          Image.asset(
            'assets/icons/$icon.png',
            width: 50,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
