import 'package:dartz/dartz.dart';
import 'package:fitted/features/apparel/data/model/apparel_response_model.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/category_products_response_model.dart';

abstract class ApparelRepository {
  Future<Either<Failure, ApparelResponseModel>> getApparel({String? brand});
  Future<Either<Failure, CategoryProductsResponseModel>> getCategoryProducts(
      {String? brand, required String category, required int page});
}
