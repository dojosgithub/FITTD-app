import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/search/domain/entity/search_product_entity.dart';
import 'package:fitted/features/search/domain/entity/search_suggestion_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SuggestionEntity>>> getSearchSuggestions(
    String suggestion,
  );

  Future<Either<Failure, List<SearchProductEntity>>> getSearchProducts({
    bool? isStandard,
    required String keyword,
    required String fitType,
  });
}
