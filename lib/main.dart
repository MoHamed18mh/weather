import 'package:flutter/material.dart';
import 'package:weather/views/core/persistent_bottom_nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather app',
      home: PersistentBottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
