import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/search_state.dart';
import 'package:weather/utils/extensions.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Timer? _debounce;

  void onQueryChanged(String query) {
    _debounce?.cancel();

    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    _debounce = Timer(const Duration(seconds: 2), () {
      emit(SearchStart(query: query.trim().capitalize));
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
