import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:weather/api/dio_consumer.dart';
import 'package:weather/cubit/weather_cubit.dart';
import 'package:weather/utils/app_colors.dart';
import 'package:weather/views/screens/forecast/forecast_screen.dart';
import 'package:weather/views/screens/home/home_screen.dart';
import 'package:weather/views/screens/search/search_screen.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class PersistentBottomNavBar extends StatelessWidget {
  const PersistentBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style6,
      padding: const EdgeInsets.symmetric(vertical: 7),
      backgroundColor: AppColors.secondaryBlack,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeScreen(),
    const SearchScreen(),
    BlocProvider(
      create: (context) =>
          WeatherCubit(DioConsumer(dio: Dio()))..getForecastWeatherByCoord(),
      child: const ForecastScreen(),
    ),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      inactiveIcon: const Icon(Icons.home_outlined),
      // title: 'Home',
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      inactiveIcon: const Icon(Icons.search_outlined),
      // title: 'Search',
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.wb_sunny),
      inactiveIcon: const Icon(Icons.wb_sunny_outlined),
      // title: 'Weather',
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
    ),
  ];
}
