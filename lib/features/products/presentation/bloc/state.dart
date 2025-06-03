part of 'bloc.dart';

class ProductState extends Equatable {
  final bool isLoading;
  final ProductDetailEntity? productDetailEntity;
  const ProductState({
    this.isLoading = true,
    this.productDetailEntity,
  });

  ProductState copyWith({
    bool? isLoading,
    ProductDetailEntity? productDetailEntity,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      productDetailEntity: productDetailEntity ?? this.productDetailEntity,
    );
  }

  @override
  List<Object?> get props => [isLoading, productDetailEntity];
}
