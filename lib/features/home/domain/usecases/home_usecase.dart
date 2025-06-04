// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/home/domain/entities/recommended_products_entity.dart';
import 'package:fitted/features/home/domain/entities/trending_products_entity.dart';
import 'package:fitted/features/home/domain/repositories/home_repository.dart';

class GetTrendingProductsUseCase {
  final HomeRepository repository;

  GetTrendingProductsUseCase(this.repository);

  Future<Either<Failure, TrendingProductsEntity>> call() async {
    return await repository.getTrendingProducts();
  }
}

class GetRecommendedProductsUseCase {
  final HomeRepository repository;
  GetRecommendedProductsUseCase(
    this.repository,
  );
  Future<Either<Failure, RecommendedProductsEntity>> call(
      String fitType) async {
    return await repository.getRecommendedProducts(fitType);
  }
}
