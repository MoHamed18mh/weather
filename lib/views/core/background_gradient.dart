import 'package:flutter/material.dart';
import 'package:weather/utils/app_colors.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    // horizontal padding of screen
    final size = MediaQuery.sizeOf(context);
    final horizontalPadding =
        ((size.width < 580) ? 18 : size.width * 0.094).toDouble();
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                AppColors.black,
                AppColors.secondaryBlack,
                AppColors.secondaryBlack,
                AppColors.secondaryBlack.withAlpha(250),
                AppColors.secondaryBlack.withAlpha(238),
                AppColors.secondaryBlack.withAlpha(231),
                AppColors.secondaryBlack.withAlpha(229),
                AppColors.secondaryBlack.withAlpha(226),
                AppColors.secondaryBlack.withAlpha(225),
                AppColors.darkBlue,
                AppColors.accentBlue,
                AppColors.lightBlue,
                AppColors.lightBlue,
              ],
            ),
          ),
          child: widget,
        ),
      ),
    );
  }
}
