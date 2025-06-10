import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:fitted/features/home/domain/entities/recommended_products_entity.dart';
import 'package:fitted/features/home/domain/entities/trending_products_entity.dart';
import 'package:fitted/features/home/domain/usecases/home_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/storage/app_storage.dart';

part 'state.dart';
part 'event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTrendingProductsUseCase getTrendingProductsUseCase;
  final GetRecommendedProductsUseCase getRecommendedProductsUseCase;
  HomeBloc({
    required this.getTrendingProductsUseCase,
    required this.getRecommendedProductsUseCase,
  }) : super(
          HomeState(
            isLoading: false,
          ),
        ) {
    on<GetTrendingProducts>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await getTrendingProductsUseCase.call();
      result.fold(
        (failure) {
          log(failure.toString());
          emit(state.copyWith(isLoading: false));
        },
        (sucess) {
          emit(
            state.copyWith(
              isLoading: false,
              trendingProductsEntity: sucess,
            ),
          );
        },
      );
    });
    on<GetRecommendedProducts>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await getRecommendedProductsUseCase
          .call(SharedPrefsStorage.getUserFit()!);
      result.fold(
        (failure) {
          log(failure.toString());
          emit(state.copyWith(isLoading: false));
        },
        (sucess) {
          emit(
            state.copyWith(
              isLoading: false,
              recommendedProductsEntity: sucess,
            ),
          );
        },
      );
    });
    on<EditWishlist>((event, emit) {
      final currentList = event.isTrending
          ? state.trendingProductsEntity!.products
          : state.recommendedProductsEntity!.products;
      final newItems = List<Product>.from(currentList);
      final updatedProduct = newItems[event.index]
          .copyWith(isWishlist: !newItems[event.index].isWishlist);
      newItems[event.index] = updatedProduct;

      final updatedEntity = event.isTrending
          ? state.trendingProductsEntity!.copyWith(products: newItems)
          : state.recommendedProductsEntity!.copyWith(products: newItems);

      emit(state.copyWith(
        trendingProductsEntity:
            event.isTrending ? updatedEntity as TrendingProductsEntity : null,
        recommendedProductsEntity: !event.isTrending
            ? updatedEntity as RecommendedProductsEntity
            : null,
      ));
    });
  }
}
