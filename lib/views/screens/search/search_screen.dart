import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/dio_consumer.dart';
import 'package:weather/cubit/search_cubit.dart';
import 'package:weather/cubit/search_state.dart';
import 'package:weather/cubit/weather_city_cubit.dart';
import 'package:weather/models/parent_models/famous_cities_model.dart';
import 'package:weather/views/core/background_gradient.dart';
import 'package:weather/views/screens/search/widgets/famous_city.dart';
import 'package:weather/views/screens/search/widgets/search_overview.dart';
import 'package:weather/views/screens/search/widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();

    return BackgroundGradient(
      widget: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          /// few words about searching
          const SliverToBoxAdapter(child: SearchOverView()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          /// search field
          SliverToBoxAdapter(
            child: SearchTextField(onChanged: searchCubit.onQueryChanged),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 125,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: famousCities.length,
                  itemBuilder: (context, index) {
                    return BlocProvider(
                      create: (context) =>
                          WeatherCityCubit(DioConsumer(dio: Dio()))
                            ..fetchWeatherByCity(famousCities[index]),
                      child: const FamousCity(),
                    );
                  },
                );
              } else if (state is SearchStart) {
                return BlocProvider(
                  create: (context) => WeatherCityCubit(DioConsumer(dio: Dio()))
                    ..fetchWeatherByCity(state.query),
                  child: const SliverToBoxAdapter(child: FamousCity()),
                );
              } else {
                return SliverToBoxAdapter(child: Container());
              }
            },
          )

          /// famous cities
        ],
      ),
    );
  }
}
