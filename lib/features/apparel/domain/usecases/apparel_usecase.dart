import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/apparel/domain/repositories/apparel_repository.dart';

import '../entities/apparel_entity.dart';
import '../entities/category_products_entity.dart';

class ApparelUseCase {
  final ApparelRepository repository;

  ApparelUseCase(this.repository);

  Future<Either<Failure, List<ApparelCategoryEntity>>> call(
      {String? brand}) async {
    final result = await repository.getApparel(brand: brand);

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.toEntities()),
    );
  }
}

class GetCategoryProductsUseCase {
  final ApparelRepository repository;

  GetCategoryProductsUseCase(this.repository);

  Future<Either<Failure, CategoryProductsEntity>> call({
    String? brand,
    required String category,
    required int page,
  }) async {
    final result = await repository.getCategoryProducts(
      brand: brand,
      category: category,
      page: page,
    );

    return result.map((model) => model.toEntity());
  }
}
