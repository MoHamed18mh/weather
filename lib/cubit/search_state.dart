class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchStart extends SearchState {
  final String query;
  SearchStart({required this.query});
}
