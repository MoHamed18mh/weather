import 'package:flutter/material.dart';
import 'package:weather/models/parent_models/current_weather_model.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/utils/extensions.dart';
import 'package:weather/views/core/background_gradient.dart';
import 'package:weather/views/screens/home/widgets/weather_info.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key, required this.currentWeather});

  final CurrentWeatherModel currentWeather;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return BackgroundGradient(
      widget: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: size.height * .2)),

          SliverToBoxAdapter(
            child: Column(
              children: [
                /// the name of the city
                Text(currentWeather.name, style: AppTextStyle.h1),

                /// the date and time of day
                Text(DateTime.now().dateTime, style: AppTextStyle.subtitleText),
                const SizedBox(height: 25),

                /// the icon that descreption the weather
                Image.asset(
                  'assets/icons/${currentWeather.weather[0].icon.replaceAll('n', 'd')}.png',
                  height: size.height * 0.2,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 25),

                /// the description of the weather
                Text(
                  currentWeather.weather[0].description,
                  style: AppTextStyle.h3,
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),

          /// the temperature and the wind speed and the humidity
          SliverToBoxAdapter(
            child: WeatherInfo(
              temp: '${currentWeather.main.temp} °C',
              windSpeed: '${currentWeather.wind.speed.kmh} km/h',
              humidity: '${currentWeather.main.humidity} %',
            ),
          ),
        ],
      ),
    );
  }
}
