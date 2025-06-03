// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fitted/features/apparel/domain/usecases/apparel_usecase.dart';

import '../../../products/domain/usecase/products_usecase.dart';
import '../../domain/entities/apparel_entity.dart';
import '../../domain/entities/category_products_entity.dart';

part "event.dart";
part "state.dart";

class ApparelBloc extends Bloc<ApparelEvent, ApparelState> {
  final ApparelUseCase apparelUsecase;
  final GetCategoryProductsUseCase getCategoryProductsUseCase;
  final WishListUseCase wishListUseCase;

  ApparelBloc({
    required this.apparelUsecase,
    required this.getCategoryProductsUseCase,
    required this.wishListUseCase,
  }) : super(
          const ApparelState(),
        ) {
    on<GetApparelEvent>(_onGetApparel);
    on<SetCategory>(_onSetCategory);
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
  }

  Future<void> _onSetCategory(
      SetCategory event, Emitter<ApparelState> emit) async {
    final category = event.category.toLowerCase();
    emit(state.copyWith(
        isLoading: true,
        currentPage: 1,
        productsEntity: [],
        selectedCategory: category));

    final result =
        await getCategoryProductsUseCase(category: category, page: 1);

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
    // Don't fetch if already loading or no more data
    if (state.isLoading || !state.hasMore) return;

    final nextPage = state.currentPage + 1;
    emit(state.copyWith(isLoading: true));

    final result = await getCategoryProductsUseCase(
      category: state.selectedCategory,
      page: nextPage,
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

        log("Length of All: ${responseModel.results}");
        log("Length of updatedList: ${updatedList.length}");
        log("More products this page: ${moreProducts.length}");
        log("No more data? $noMoreData");

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

    final result = await apparelUsecase(brand: event.brand);

    result.fold(
      (failure) {
        log("Error fetching apparel: ${failure.message}");
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
}
