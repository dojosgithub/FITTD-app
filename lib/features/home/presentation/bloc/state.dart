// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final TrendingProductsEntity? trendingProductsEntity;
  const HomeState({
    required this.isLoading,
    this.trendingProductsEntity,
  });

  @override
  List<Object?> get props => [isLoading, trendingProductsEntity];

  HomeState copyWith({
    bool? isLoading,
    TrendingProductsEntity? trendingProductsEntity,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      trendingProductsEntity:
          trendingProductsEntity ?? this.trendingProductsEntity,
    );
  }
}
