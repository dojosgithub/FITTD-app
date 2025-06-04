import 'package:equatable/equatable.dart';

import '../../data/models/recommended_products_response_model.dart';
import 'trending_products_entity.dart';

class RecommendedProductsEntity extends Equatable {
  final List<Product> products;

  const RecommendedProductsEntity({required this.products});

  RecommendedProductsEntity copyWith({List<Product>? products}) {
    return RecommendedProductsEntity(
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [products];
}

extension RecommendedProductsMapper on RecommendedProductsResponseModel {
  RecommendedProductsEntity toEntity() {
    final productElements = data?.products ?? [];

    return RecommendedProductsEntity(
      products: productElements
          .where((p) => p.product != null)
          .map((e) => Product(
                id: e.product?.id ?? '',
                name: e.product?.name ?? '',
                price: e.product?.price ?? '',
                imageUrl: e.product?.image?.primary ?? '',
                isWishlist: e.isWishlist ?? false,
                clickCount: 0,
              ))
          .toList(),
    );
  }
}
