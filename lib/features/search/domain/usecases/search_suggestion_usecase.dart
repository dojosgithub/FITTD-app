// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';
import 'package:fitted/features/search/domain/repository/search_respository.dart';

import '../entity/search_suggestion_entity.dart';

class SearchSuggestionUsecase {
  final SearchRepository respository;
  SearchSuggestionUsecase(this.respository);

  Future<Either<Failure, List<SuggestionEntity>>> call(
      String suggestion) async {
    return await respository.getSearchSuggestions(suggestion);
  }
}
