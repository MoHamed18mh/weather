import 'package:flutter/material.dart';
import 'package:weather/utils/app_colors.dart';

abstract class AppTextStyle {
  static const h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const h3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const subtitleText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static const largeSubtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );

  static const error = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );
}
