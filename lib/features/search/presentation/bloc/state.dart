part of 'bloc.dart';

class SearchState extends Equatable {
  final List<SuggestionEntity>? suggestionEntity;
  final String searchQuery;
  const SearchState({
    required this.suggestionEntity,
    required this.searchQuery,
  });

  SearchState copyWith({
    List<SuggestionEntity>? suggestionEntity,
    String? searchQuery,
  }) {
    return SearchState(
      suggestionEntity: suggestionEntity ?? this.suggestionEntity,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [suggestionEntity];
}
