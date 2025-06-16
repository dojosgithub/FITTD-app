import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../search/domain/entity/search_product_entity.dart';
import '../../../search/domain/entity/search_suggestion_entity.dart';
import '../../data/model/apparel_response_model.dart';
import '../../data/model/category_products_response_model.dart';

abstract class ApparelRepository {
  Future<Either<Failure, ApparelResponseModel>> getApparel({String? brand});
  Future<Either<Failure, CategoryProductsResponseModel>> getCategoryProducts({
    String? brand,
    required String category,
    required int page,
  });
  Future<Either<Failure, List<SuggestionEntity>>> getSearchSuggestions({
    required String suggestion,
    String? brand,
    required String category,
  });

  Future<Either<Failure, List<SearchProductEntity>>> getSearchProducts({
    required String keyword,
    required String fitType,
    String? brand,
    required String category,
  });
}
