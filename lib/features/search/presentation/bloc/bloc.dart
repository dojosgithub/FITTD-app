import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/features/search/domain/entity/search_suggestion_entity.dart';
import 'package:fitted/features/search/domain/usecases/search_suggestion_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../domain/entity/search_product_entity.dart';
part "state.dart";
part "event.dart";

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchSuggestionUsecase searchSuggestionUsecase;
  final SearchProductUsecase searchProductUsecase;

  SearchBloc(
      {required this.searchSuggestionUsecase,
      required this.searchProductUsecase})
      : super(SearchState(
          isStandard: false,
          suggestionEntity: null,
          searchQuery: "",
          searchProductEntity: null,
          selectedQuery: "",
          fitType: SharedPrefsStorage.getUserFit()!,
          filterList: [
            {
              "title": "According to measurements",
              "isSelected": true,
            },
            {
              "title": "Standard",
              "isSelected": false,
            },
          ],
        )) {
    on<SearchQuery>(
      _onSearchQuery,
      transformer: (events, mapper) {
        return events
            .debounce(const Duration(milliseconds: 200))
            .asyncExpand(mapper);
      },
    );
    on<SearchProducts>((event, emit) async {
      emit(state.copyWith(selectedQuery: event.keyword));
      final result = await searchProductUsecase.call(
        keyword: event.keyword,
        isStandard: state.filterList[1]['isSelected'],
        fitType: state.fitType,
      );

      result.fold(
        (failure) => log(failure.message),
        (success) {
          log(success.length.toString());
          emit(state.copyWith(searchProductEntity: success));
        },
      );
    });

    on<SelectFilter>((event, emit) {
      List<Map> updatedFilter = state.filterList
          .map((e) => Map.from(e)..['isSelected'] = false)
          .toList();

      updatedFilter[event.selectedIndex]['isSelected'] = true;

      emit(state.copyWith(filterList: updatedFilter));
      add(SearchProducts(keyword: state.selectedQuery));
    });

    on<SelectFit>((event, emit) {
      emit(state.copyWith(fitType: event.fit));
      add(SearchProducts(keyword: state.selectedQuery));
    });
  }

  Future<void> _onSearchQuery(
      SearchQuery event, Emitter<SearchState> emit) async {
    emit(state.copyWith(searchQuery: event.query, suggestionEntity: []));

    if (event.query.isEmpty) return;

    final result = await searchSuggestionUsecase.call(event.query);

    result.fold(
      (failure) => log(failure.message),
      (success) => emit(state.copyWith(suggestionEntity: success)),
    );
  }
}
