import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:fitted/features/home/domain/entities/trending_products_entity.dart';
import 'package:fitted/features/home/domain/usecases/home_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTrendingProductsUseCase getTrendingProductsUseCase;
  HomeBloc({required this.getTrendingProductsUseCase})
      : super(HomeState(isLoading: false)) {
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
    on<EditWishlist>((event, emit) {
      final currentList = state.trendingProductsEntity!.products;
      final newItems = List<Product>.from(currentList);
      final updatedProduct = newItems[event.index]
          .copyWith(isWishlist: !newItems[event.index].isWishlist);
      newItems[event.index] = updatedProduct;

      final updatedEntity =
          state.trendingProductsEntity!.copyWith(products: newItems);

      emit(state.copyWith(trendingProductsEntity: updatedEntity));
    });
  }
}
