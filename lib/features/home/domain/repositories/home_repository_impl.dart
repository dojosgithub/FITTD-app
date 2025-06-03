// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/home/domain/entities/trending_products_entity.dart';

import '../../data/datasources/home_remotedatasource.dart';
import 'home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, TrendingProductsEntity>> getTrendingProducts() async {
    try {
      final response = await homeRemoteDataSource.getTrendingProducts();

      return Right(response.toEntity());
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
