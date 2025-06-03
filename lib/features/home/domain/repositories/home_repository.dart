import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';

import '../entities/trending_products_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, TrendingProductsEntity>> getTrendingProducts();
}
