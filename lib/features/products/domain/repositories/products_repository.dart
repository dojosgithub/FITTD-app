import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/model/products_detail_response_model.dart';

abstract class ProductsRepository {
  Future<Either<Failure, ProductDetailResponseModel>> getProductDetails({
    required String id,
  });
  Future<Either<Failure, dynamic>> addClick({required String id});
  Future<Either<Failure, dynamic>> wishList(
      {required String id, required bool isAdded});
}
