// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class SearchState extends Equatable {
  final List<SearchProductEntity>? searchProductEntity;
  final List<SuggestionEntity>? suggestionEntity;
  final String searchQuery;
  final String selectedQuery;
  final String fitType;
  final bool isStandard;
  final List<Map> filterList;
  const SearchState({
    required this.suggestionEntity,
    required this.searchProductEntity,
    required this.searchQuery,
    required this.isStandard,
    required this.selectedQuery,
    required this.fitType,
    required this.filterList,
  });

  SearchState copyWith({
    List<SuggestionEntity>? suggestionEntity,
    List<SearchProductEntity>? searchProductEntity,
    String? searchQuery,
    bool? isStandard,
    String? selectedQuery,
    List<Map>? filterList,
    String? fitType,
  }) {
    return SearchState(
      suggestionEntity: suggestionEntity ?? this.suggestionEntity,
      searchProductEntity: searchProductEntity ?? this.searchProductEntity,
      searchQuery: searchQuery ?? this.searchQuery,
      isStandard: isStandard ?? this.isStandard,
      fitType: fitType ?? this.fitType,
      selectedQuery: selectedQuery ?? this.selectedQuery,
      filterList: filterList ?? this.filterList,
    );
  }

  @override
  List<Object?> get props => [
        suggestionEntity,
        searchQuery,
        searchProductEntity,
        isStandard,
        fitType,
        selectedQuery,
        filterList
      ];
}
