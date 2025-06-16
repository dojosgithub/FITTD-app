import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/apparel/data/model/apparel_response_model.dart';
import 'package:fitted/features/apparel/domain/repositories/apparel_repository.dart';
import 'package:fitted/features/search/domain/entity/search_suggestion_entity.dart';

import '../../../search/domain/entity/search_product_entity.dart';
import '../../data/datasources/apparel_remote_datasource.dart';
import '../../data/model/category_products_response_model.dart';

class ApparelRepositoryImpl extends ApparelRepository {
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

  @override
  Future<Either<Failure, List<SearchProductEntity>>> getSearchProducts({
    required String keyword,
    required String fitType,
    String? brand,
    required String category,
  }) async {
    try {
      final response = await remoteDataSource.getSearchProducts(
        keyword: keyword,
        category: category,
        brand: brand,
        fitType: fitType,
      );

      return Right(response.toEntityList());
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<SuggestionEntity>>> getSearchSuggestions({
    required String suggestion,
    String? brand,
    required String category,
  }) async {
    try {
      final response = await remoteDataSource.getSearchSuggestions(
        suggestion: suggestion,
        brand: brand,
        category: category,
      );

      return Right(response.toEntityList());
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
