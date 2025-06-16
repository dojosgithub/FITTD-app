import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/apparel/domain/repositories/apparel_repository.dart';
import 'package:fitted/features/search/domain/entity/search_product_entity.dart';

import '../../../search/domain/entity/search_suggestion_entity.dart';
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

class ApparelSearchSuggestionUsecase {
  final ApparelRepository respository;
  ApparelSearchSuggestionUsecase(this.respository);

  Future<Either<Failure, List<SuggestionEntity>>> call({
    required String suggestion,
    String? brand,
    required String category,
  }) async {
    return await respository.getSearchSuggestions(
      suggestion: suggestion,
      category: category,
      brand: brand,
    );
  }
}

class ApparelSearchProductUsecase {
  final ApparelRepository respository;
  ApparelSearchProductUsecase(this.respository);

  Future<Either<Failure, List<SearchProductEntity>>> call({
    required String keyword,
    required String fitType,
    String? brand,
    required String category,
  }) async {
    return await respository.getSearchProducts(
      keyword: keyword,
      category: category,
      brand: brand,
      fitType: fitType,
    );
  }
}
