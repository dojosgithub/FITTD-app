import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:fitted/features/search/domain/entity/search_suggestion_entity.dart';
import 'package:fitted/features/search/domain/usecases/search_suggestion_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
part "state.dart";
part "event.dart";

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchSuggestionUsecase searchSuggestionUsecase;

  SearchBloc({required this.searchSuggestionUsecase})
      : super(const SearchState(suggestionEntity: null, searchQuery: "")) {
    on<SearchQuery>(
      _onSearchQuery,
      transformer: (events, mapper) {
        return events
            .debounce(const Duration(milliseconds: 400))
            .asyncExpand(mapper);
      },
    );
  }

  Future<void> _onSearchQuery(
      SearchQuery event, Emitter<SearchState> emit) async {
    emit(state.copyWith(searchQuery: event.query));
    if (event.query.isEmpty) {
      // emit(state.copyWith(suggestionEntity: null));
      return;
    }
    final result = await searchSuggestionUsecase.call(event.query);

    result.fold(
      (failure) => log(failure.message),
      (success) => emit(state.copyWith(suggestionEntity: success)),
    );
  }
}
