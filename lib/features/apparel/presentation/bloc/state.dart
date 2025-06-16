// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class ApparelState extends Equatable {
  final bool isLoading;
  final String? error;
  final String selectedCategory;
  final String? selectedBrand;
  final int currentPage;
  final bool hasMore;
  final List<ApparelCategoryEntity>? apparelEntity;
  final List<ProductEntity>? productsEntity;
  final List<SuggestionEntity>? suggestionEntity;
  final List<SearchProductEntity>? searchProductEntity;
  final String searchQuery;

  const ApparelState({
    this.isLoading = true,
    this.error,
    this.selectedCategory = "",
    this.selectedBrand,
    this.apparelEntity,
    this.productsEntity,
    this.currentPage = 1,
    this.hasMore = false,
    this.searchQuery = '',
    this.suggestionEntity,
    this.searchProductEntity,
  });

  @override
  List<Object?> get props => [
        isLoading,
        error,
        apparelEntity,
        productsEntity,
        currentPage,
        hasMore,
        selectedBrand,
        selectedCategory,
        searchQuery,
        suggestionEntity,
        searchProductEntity
      ];

  ApparelState copyWith({
    bool? isLoading,
    String? error,
    String? selectedCategory,
    String? selectedBrand,
    String? searchQuery,
    int? currentPage,
    bool? hasMore,
    List<ApparelCategoryEntity>? apparelEntity,
    List<ProductEntity>? productsEntity,
    List<SuggestionEntity>? suggestionEntity,
    List<SearchProductEntity>? searchProductEntity,
  }) {
    return ApparelState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedBrand: selectedBrand ?? this.selectedBrand,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      apparelEntity: apparelEntity ?? this.apparelEntity,
      productsEntity: productsEntity ?? this.productsEntity,
      suggestionEntity: suggestionEntity ?? this.suggestionEntity,
      searchQuery: searchQuery ?? this.searchQuery,
      searchProductEntity: searchProductEntity ?? this.searchProductEntity,
    );
  }
}
