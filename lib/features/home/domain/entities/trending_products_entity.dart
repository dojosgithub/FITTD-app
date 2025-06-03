import 'package:equatable/equatable.dart';
import '../../data/models/trending_products_response_model.dart';

class TrendingProductsEntity extends Equatable {
  final List<Product> products;

  const TrendingProductsEntity({required this.products});

  TrendingProductsEntity copyWith({List<Product>? products}) {
    return TrendingProductsEntity(
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [products];
}

class Product extends Equatable {
  final String id;
  final String name;
  final String price;
  final String imageUrl;
  final int clickCount;
  final bool isWishlist;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.clickCount,
    required this.isWishlist,
  });

  Product copyWith({
    String? id,
    String? name,
    String? price,
    String? imageUrl,
    int? clickCount,
    bool? isWishlist,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      clickCount: clickCount ?? this.clickCount,
      isWishlist: isWishlist ?? this.isWishlist,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, price, imageUrl, clickCount, isWishlist];
}

extension TrendingProductsMapper on TrendingProductsResponseModel {
  TrendingProductsEntity toEntity() {
    return TrendingProductsEntity(
      products: data.map((datum) {
        return Product(
          id: datum.id ?? '',
          name: datum.name ?? '',
          price: datum.price ?? '',
          imageUrl: datum.image?.primary ?? '',
          clickCount: datum.clickCount ?? 0,
          isWishlist: datum.isWishlist ?? false,
        );
      }).toList(),
    );
  }
}
