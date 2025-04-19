import 'package:flutter/material.dart';
import 'package:weather/utils/app_text_style.dart';

class CityTile extends StatelessWidget {
  const CityTile({
    super.key,
    required this.temp,
    required this.description,
    required this.icon,
    required this.cityName,
  });
  final int temp;
  final String description;
  final String icon;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            /// weather info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$temp°',
                    style: AppTextStyle.h3,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: AppTextStyle.subtitleText,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            /// weather icon
            Image.asset(
              'assets/icons/$icon.png',
              height: 35,
            ),
          ],
        ),

        /// city name
        Text(
          cityName,
          style: AppTextStyle.largeSubtitle,
        )
      ],
    );
  }
}
