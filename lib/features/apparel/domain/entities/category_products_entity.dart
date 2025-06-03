import '../../data/model/category_products_response_model.dart';

class CategoryProductsEntity {
  final int results;
  final Map<String, List<ProductEntity>> productsByCategory;

  CategoryProductsEntity({
    required this.results,
    required this.productsByCategory,
  });
}

class ProductEntity {
  final String id;
  final String brand;
  final String category;
  final String name;
  final String price;
  final String imageUrl;
  final bool isWishlist;

  ProductEntity({
    required this.id,
    required this.brand,
    required this.category,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.isWishlist,
  });

  ProductEntity copyWith({
    String? id,
    String? brand,
    String? category,
    String? name,
    String? price,
    String? imageUrl,
    bool? isWishlist,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isWishlist: isWishlist ?? this.isWishlist,
    );
  }
}

extension CategoryProductsMapper on CategoryProductsResponseModel {
  CategoryProductsEntity toEntity() {
    final dataMap = data?.productsByCategory ?? {};

    final mapped = dataMap.map((key, products) => MapEntry(
          key,
          products
              .map((p) => ProductEntity(
                    id: p.id ?? '',
                    brand: p.brand ?? '',
                    category: p.category ?? '',
                    name: p.name ?? '',
                    price: p.price ?? '',
                    imageUrl: p.image?.primary ?? '',
                    isWishlist: p.isWishlist ?? false,
                  ))
              .toList(),
        ));

    return CategoryProductsEntity(
      results: results ?? 0,
      productsByCategory: mapped,
    );
  }
}
