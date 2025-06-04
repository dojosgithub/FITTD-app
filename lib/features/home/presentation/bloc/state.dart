// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final TrendingProductsEntity? trendingProductsEntity;
  final RecommendedProductsEntity? recommendedProductsEntity;
  const HomeState({
    required this.isLoading,
    this.trendingProductsEntity,
    this.recommendedProductsEntity,
  });

  @override
  List<Object?> get props =>
      [isLoading, trendingProductsEntity, recommendedProductsEntity];

  HomeState copyWith({
    bool? isLoading,
    TrendingProductsEntity? trendingProductsEntity,
    RecommendedProductsEntity? recommendedProductsEntity,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      trendingProductsEntity:
          trendingProductsEntity ?? this.trendingProductsEntity,
      recommendedProductsEntity:
          recommendedProductsEntity ?? this.recommendedProductsEntity,
    );
  }
}
