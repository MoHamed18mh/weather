import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather_city_cubit.dart';
import 'package:weather/cubit/weather_city_state.dart';
import 'package:weather/utils/app_colors.dart';
import 'package:weather/utils/app_strings.dart';
import 'package:weather/utils/app_text_style.dart';
import 'package:weather/views/screens/home/weather_details_screen.dart';
import 'package:weather/views/screens/search/widgets/city_tile.dart';

class FamousCity extends StatelessWidget {
  const FamousCity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCityCubit, WeatherCityState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            color: AppColors.accentBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: (state is WeatherCityLoading)
              ? const CircularProgressIndicator(color: Colors.white)
              : (state is WeatherCitySuccess)
                  ? InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherDetailsScreen(
                            currentWeather: state.currentWeather,
                          ),
                        ),
                      ),
                      child: CityTile(
                        temp: state.currentWeather.main.temp.round(),
                        description:
                            state.currentWeather.weather[0].description,
                        icon: state.currentWeather.weather[0].icon
                            .replaceAll('n', 'd'),
                        cityName: state.currentWeather.name,
                      ),
                    )
                  : (state is WeatherCityFailure)
                      ? Text(state.error, style: AppTextStyle.error)
                      : const Text(AppStrings.error, style: AppTextStyle.error),
        );
      },
    );
  }
}
