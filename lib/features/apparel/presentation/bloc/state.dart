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

  const ApparelState({
    this.isLoading = true,
    this.error,
    this.selectedCategory = "",
    this.selectedBrand,
    this.apparelEntity,
    this.productsEntity,
    this.currentPage = 1,
    this.hasMore = false,
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
      ];

  ApparelState copyWith({
    bool? isLoading,
    String? error,
    String? selectedCategory,
    String? selectedBrand,
    int? currentPage,
    bool? hasMore,
    List<ApparelCategoryEntity>? apparelEntity,
    List<ProductEntity>? productsEntity,
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
    );
  }
}
