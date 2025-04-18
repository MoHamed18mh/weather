import 'package:flutter/material.dart';
import 'package:weather/utils/app_colors.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/utils/app_text_style.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TextField(
        // controller: context.watch<WeatherCubit>().controller,
        style: AppTextStyle.h3,
        decoration: InputDecoration(
          hintText: AppStrings.search,
          hintStyle: AppTextStyle.subtitleText,
          fillColor: AppColors.accentBlue,
          filled: true,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
