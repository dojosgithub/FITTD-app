// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';

import '../entity/search_product_entity.dart';
import '../entity/search_suggestion_entity.dart';
import '../repository/search_respository.dart';

class SearchSuggestionUsecase {
  final SearchRepository respository;
  SearchSuggestionUsecase(this.respository);

  Future<Either<Failure, List<SuggestionEntity>>> call(
      String suggestion) async {
    return await respository.getSearchSuggestions(suggestion);
  }
}

class SearchProductUsecase {
  final SearchRepository respository;
  SearchProductUsecase(this.respository);

  Future<Either<Failure, List<SearchProductEntity>>> call({
    bool? isStandard,
    required String keyword,
    required String fitType,
  }) async {
    return await respository.getSearchProducts(
      keyword: keyword,
      isStandard: isStandard,
      fitType: fitType,
    );
  }
}
