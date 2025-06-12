// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fitted/core/errors/failure.dart';

import '../../data/datasource/search_datasource.dart';
import '../entity/search_suggestion_entity.dart';
import 'search_respository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource dataSource;
  SearchRepositoryImpl(this.dataSource);
  @override
  @override
  Future<Either<Failure, List<SuggestionEntity>>> getSearchSuggestions(
      String suggestion) async {
    try {
      final response = await dataSource.getSearchSuggestions(suggestion);

      return Right(response.toEntityList());
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
