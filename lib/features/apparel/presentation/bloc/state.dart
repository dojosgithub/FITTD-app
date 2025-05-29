// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class ApparelState extends Equatable {
  final bool isLoading;
  final String? error;
  final String selectedCategory;
  final List<ApparelCategoryEntity>? apparelEntity;
  final List<ProductEntity>? productsEntity;

  const ApparelState({
    this.isLoading = true,
    this.error,
    this.selectedCategory = "",
    this.apparelEntity,
    this.productsEntity,
  });

  @override
  List<Object?> get props => [isLoading, error, apparelEntity, productsEntity];

  ApparelState copyWith({
    bool? isLoading,
    String? error,
    String? selectedCategory,
    List<ApparelCategoryEntity>? apparelEntity,
    List<ProductEntity>? productsEntity,
  }) {
    return ApparelState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      apparelEntity: apparelEntity ?? this.apparelEntity,
      productsEntity: productsEntity ?? this.productsEntity,
    );
  }
}
