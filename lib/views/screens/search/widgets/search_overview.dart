import 'package:flutter/material.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/utils/app_text_style.dart';

class SearchOverView extends StatelessWidget {
  const SearchOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          AppStrings.pickLocation,
          style: AppTextStyle.h1,
        ),
        SizedBox(height: 15),
        Text(
          AppStrings.findAreaAndCity,
          style: AppTextStyle.subtitleText,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}