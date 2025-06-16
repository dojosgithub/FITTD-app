import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitted/config/storage/app_storage.dart';

import 'package:fitted/features/apparel/domain/usecases/apparel_usecase.dart';
import 'package:fitted/features/search/domain/entity/search_product_entity.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../products/domain/usecase/products_usecase.dart';
import '../../../search/domain/entity/search_suggestion_entity.dart';
import '../../domain/entities/apparel_entity.dart';
import '../../domain/entities/category_products_entity.dart';

part "event.dart";
part "state.dart";

class ApparelBloc extends Bloc<ApparelEvent, ApparelState> {
  final ApparelUseCase apparelUsecase;
  final GetCategoryProductsUseCase getCategoryProductsUseCase;
  final WishListUseCase wishListUseCase;
  final ApparelSearchProductUsecase apparelSearchProductUsecase;
  final ApparelSearchSuggestionUsecase apparelSearchSuggestionUsecase;

  ApparelBloc({
    required this.apparelUsecase,
    required this.getCategoryProductsUseCase,
    required this.wishListUseCase,
    required this.apparelSearchProductUsecase,
    required this.apparelSearchSuggestionUsecase,
  }) : super(
          const ApparelState(),
        ) {
    on<GetApparelEvent>(_onGetApparel);
    on<SetCategory>(_onSetCategory);
    on<SetBrand>((event, emit) {
      emit(state.copyWith(
        selectedBrand: event.brand,
      ));
    });
    on<LoadMoreCategoryProducts>(_onLoadMoreCategoryProducts);
    on<WishList>((event, emit) async {
      if (!event.skip) {
        final updateProduct = state.productsEntity!
            .map((product) => product.id == event.productId
                ? product.copyWith(isWishlist: !event.isAdded)
                : product)
            .toList();

        emit(state.copyWith(
          isLoading: false,
          productsEntity: updateProduct,
        ));
      }
      final result = await wishListUseCase.call(
        id: event.productId,
        isAdded: event.isAdded,
      );
      result.fold(
        (failure) => emit(state.copyWith(isLoading: false)),
        (response) {},
      );
    });
    on<SearchQuery>(
      _onSearchQuery,
      transformer: (events, mapper) {
        return events
            .debounce(const Duration(milliseconds: 200))
            .asyncExpand(mapper);
      },
    );
    on<SearchProducts>((event, emit) async {
      emit(
        state.copyWith(
          suggestionEntity: [],
          searchQuery: event.keyword,
          isLoading: true,
        ),
      );
      final result = await apparelSearchProductUsecase.call(
        keyword: event.keyword,
        category: state.selectedCategory,
        brand: state.selectedBrand,
        fitType: SharedPrefsStorage.getUserFit()!,
      );

      result.fold(
        (failure) => emit(state.copyWith(isLoading: false)),
        (success) => emit(state.copyWith(
          searchProductEntity: success,
          isLoading: false,
        )),
      );
    });
  }

  Future<void> _onSetCategory(
      SetCategory event, Emitter<ApparelState> emit) async {
    final category = event.category.toLowerCase();
    emit(state.copyWith(
        isLoading: true,
        currentPage: 1,
        productsEntity: [],
        selectedCategory: category));

    final result = await getCategoryProductsUseCase(
        category: category, page: 1, brand: state.selectedBrand);

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      (responseModel) {
        final newProducts = responseModel.productsByCategory[category] ?? [];
        emit(state.copyWith(
          isLoading: false,
          productsEntity: newProducts,
          hasMore: state.productsEntity!.length < responseModel.results,
        ));
      },
    );
  }

  Future<void> _onLoadMoreCategoryProducts(
    LoadMoreCategoryProducts event,
    Emitter<ApparelState> emit,
  ) async {
    if (state.isLoading || !state.hasMore || state.searchQuery != "") return;

    final nextPage = state.currentPage + 1;
    emit(state.copyWith(isLoading: true));

    final result = await getCategoryProductsUseCase(
      category: state.selectedCategory,
      page: nextPage,
      brand: state.selectedBrand,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
      (responseModel) {
        final moreProducts =
            responseModel.productsByCategory[state.selectedCategory] ?? [];

        final updatedList = [
          ...state.productsEntity ?? <ProductEntity>[],
          ...moreProducts,
        ];

        const int pageSize = 10; // adjust if your page size differs

        final noMoreData = moreProducts.length < pageSize ||
            updatedList.length >= responseModel.results;

        emit(state.copyWith(
          isLoading: false,
          productsEntity: updatedList,
          currentPage: nextPage,
          hasMore: !noMoreData,
        ));
      },
    );
  }

  Future<void> _onGetApparel(
    GetApparelEvent event,
    Emitter<ApparelState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await apparelUsecase(brand: state.selectedBrand);

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          error: failure.message,
        ));
      },
      (apparelResponseModel) {
        emit(state.copyWith(
          isLoading: false,
          apparelEntity: apparelResponseModel,
        ));
      },
    );
  }

  Future<void> _onSearchQuery(
      SearchQuery event, Emitter<ApparelState> emit) async {
    emit(state.copyWith(
      searchQuery: event.query,
      suggestionEntity: [],
      searchProductEntity: [],
    ));

    if (event.query.isEmpty) return;

    emit(state.copyWith(isLoading: true));

    final result = await apparelSearchSuggestionUsecase.call(
        suggestion: event.query,
        category: state.selectedCategory,
        brand: state.selectedBrand);

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false)),
      (success) => emit(state.copyWith(
        suggestionEntity: success,
        isLoading: false,
      )),
    );
  }
}
