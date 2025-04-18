import 'package:flutter/material.dart';
import 'package:weather/utils/app_colors.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 54,
      decoration: const BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Icon(
        Icons.location_on_outlined,
        color: Colors.white,
      ),
    );
  }
}
