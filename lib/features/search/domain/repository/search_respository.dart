import 'package:dartz/dartz.dart';
import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/search/domain/entity/search_suggestion_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SuggestionEntity>>> getSearchSuggestions(
      String suggestion);
}
