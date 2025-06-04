import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/home/domain/entities/recommended_products_entity.dart';

import '../entities/trending_products_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, TrendingProductsEntity>> getTrendingProducts();
  Future<Either<Failure, RecommendedProductsEntity>> getRecommendedProducts(
      String fitType);
}
