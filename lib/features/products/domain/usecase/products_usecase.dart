import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/products/domain/repositories/products_repository.dart';
import '../entities/product_detail_entity.dart';

class GetProductsDetailUsecase {
  final ProductsRepository repository;
  GetProductsDetailUsecase(this.repository);

  Future<Either<Failure, ProductDetailEntity>> call(
      {required String id, required String userId}) async {
    final result = await repository.getProductDetails(id: id, userId: userId);

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.toEntity()),
    );
  }
}

class AddClickUseCase {
  final ProductsRepository repository;
  AddClickUseCase(this.repository);

  Future<Either<Failure, dynamic>> call({required String id}) async {
    final result = await repository.addClick(id: id);

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response),
    );
  }
}

class WishListUseCase {
  final ProductsRepository repository;
  WishListUseCase(
    this.repository,
  );
  Future<Either<Failure, dynamic>> call(
      {required String id, required bool isAdded}) async {
    final result = await repository.wishList(id: id, isAdded: isAdded);

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response),
    );
  }
}
