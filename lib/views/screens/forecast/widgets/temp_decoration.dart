import 'package:flutter/material.dart';

class TempDecoration extends StatelessWidget {
  const TempDecoration({super.key, required this.temp});
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temp,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 37,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          '°C',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 19,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
