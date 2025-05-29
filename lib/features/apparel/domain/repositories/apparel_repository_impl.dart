import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/apparel/data/model/apparel_response_model.dart';
import 'package:fitted/features/apparel/domain/repositories/apparel_repository.dart';

import '../../data/datasources/apparel_remotedatasource.dart';
import '../../data/model/category_products_response_model.dart';

class ApparelRepositoryImpl extends ApparelRepository {
  // Assuming you have a remote data source injected
  final ApparelRemoteDataSource remoteDataSource;

  ApparelRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ApparelResponseModel>> getApparel(
      {String? brand}) async {
    try {
      final apparelResponse = await remoteDataSource.getApparel(brand: brand);
      return Right(apparelResponse);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryProductsResponseModel>> getCategoryProducts(
      {String? brand, required String category, required int page}) async {
    try {
      final categoryProductsResponse =
          await remoteDataSource.getCategoryProducts(
        category: category,
        brand: brand,
        page: page,
      );
      return Right(categoryProductsResponse);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
