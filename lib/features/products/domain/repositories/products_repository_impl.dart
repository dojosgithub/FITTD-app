// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/products/data/model/products_detail_response_model.dart';

import '../../data/datasources/products_remote_datasource.dart';
import 'products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsRemoteDataSource productsRemoteDatasource;
  ProductsRepositoryImpl(this.productsRemoteDatasource);
  @override
  Future<Either<Failure, ProductDetailResponseModel>> getProductDetails(
      {required String id, required String userId}) async {
    try {
      final response = await productsRemoteDatasource.getProductDetailsGuest(
          id: id, userId: userId);

      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addClick({required String id}) async {
    try {
      final response = await productsRemoteDatasource.addClick(id: id);

      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> wishList(
      {required String id, required bool isAdded}) async {
    try {
      final response = await productsRemoteDatasource.wishList(
        id: id,
        isAdded: isAdded,
      );

      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
