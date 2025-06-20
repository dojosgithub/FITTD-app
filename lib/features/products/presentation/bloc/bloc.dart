import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/features/products/domain/entities/product_detail_entity.dart';
import 'package:fitted/features/products/domain/usecase/products_usecase.dart';
part 'state.dart';
part 'event.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsDetailUsecase getProductsDetailUsecase;
  final AddClickUseCase addClickUseCase;
  final WishListUseCase wishListUseCase;
  ProductsBloc({
    required this.getProductsDetailUsecase,
    required this.addClickUseCase,
    required this.wishListUseCase,
  }) : super(
          const ProductState(),
        ) {
    on<GetProductDetails>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        final result = await getProductsDetailUsecase.call(
          id: event.productId,
          userId: event.userId ?? SharedPrefsStorage.getUserId()!,
        );
        result.fold(
          (failure) => emit(state.copyWith(isLoading: false)),
          (response) {
            emit(
              state.copyWith(
                isLoading: false,
                productDetailEntity: response,
              ),
            );
          },
        );
      },
    );
    on<AddClick>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        final result = await addClickUseCase.call(id: event.productId);
        result.fold(
          (failure) => emit(state.copyWith(isLoading: false)),
          (response) {
            emit(
              state.copyWith(
                isLoading: false,
              ),
            );
          },
        );
      },
    );
    on<WishList>((event, emit) async {
      final updatedSimilarProducts = state.productDetailEntity!.similarProducts
          .map((product) => product.id == event.productId
              ? product.copyWith(isWishlist: !event.isAdded)
              : product)
          .toList();
      final updatedProductDetailEntity = ProductDetailEntity(
        product: state.productDetailEntity!.product,
        alterationRequired: state.productDetailEntity!.alterationRequired,
        attributeDifferences: state.productDetailEntity!.attributeDifferences,
        recommendedSize: state.productDetailEntity!.recommendedSize,
        fitType: state.productDetailEntity!.fitType,
        similarProducts: updatedSimilarProducts,
      );

      emit(state.copyWith(
        isLoading: false,
        productDetailEntity: updatedProductDetailEntity,
      ));
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
}
