import '../../data/model/products_detail_response_model.dart';

class ProductDetailEntity {
  final ProductEntity product;
  final bool alterationRequired;
  final AttributeDifferencesEntity attributeDifferences;
  final String recommendedSize;
  final String fitType;
  final List<SimilarProductEntity> similarProducts;

  ProductDetailEntity({
    required this.product,
    required this.alterationRequired,
    required this.attributeDifferences,
    required this.recommendedSize,
    required this.fitType,
    required this.similarProducts,
  });
}

class ProductEntity {
  final String id;
  final String brand;
  final String category;
  final String name;
  final String url;
  final String description;
  final String price;
  final ProductImageEntity image;
  final List<ProductSizeEntity> sizes;
  final String gender;
  final double? rating;
  final int? reviewCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductEntity({
    required this.id,
    required this.brand,
    required this.category,
    required this.name,
    required this.url,
    required this.description,
    required this.price,
    required this.image,
    required this.sizes,
    required this.gender,
    this.rating,
    this.reviewCount,
    required this.createdAt,
    required this.updatedAt,
  });
}

class ProductImageEntity {
  final String primary;
  final List<String> secondary;

  ProductImageEntity({required this.primary, required this.secondary});
}

class ProductSizeEntity {
  final String id;
  final String size;
  final bool inStock;

  ProductSizeEntity(
      {required this.id, required this.size, required this.inStock});
}

class AttributeDifferencesEntity {
  final String bust;
  final String? bustDirection;
  final String waist;
  final String? waistDirection;
  final String? sleevesDirection;
  final String? sleeves;

  AttributeDifferencesEntity({
    required this.bust,
    this.bustDirection,
    required this.waist,
    this.waistDirection,
    this.sleevesDirection,
    required this.sleeves,
  });
}

class SimilarProductEntity {
  final String id;
  final String name;
  final String price;
  final String primaryImage;
  final bool isWishlist;

  SimilarProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.primaryImage,
    required this.isWishlist,
  });

  SimilarProductEntity copyWith({
    String? id,
    String? name,
    String? price,
    String? primaryImage,
    bool? isWishlist,
  }) {
    return SimilarProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      primaryImage: primaryImage ?? this.primaryImage,
      isWishlist: isWishlist ?? this.isWishlist,
    );
  }
}

extension ProductModelMapper on ProductDetailResponseModel {
  ProductDetailEntity toEntity() {
    final product = this.product;
    return ProductDetailEntity(
      alterationRequired: alterationRequired ?? false,
      attributeDifferences: attributeDifferences != null
          ? AttributeDifferencesEntity(
              bust: attributeDifferences!.bust ?? '',
              bustDirection: attributeDifferences!.bustDirection,
              waist: attributeDifferences!.waist ?? '',
              waistDirection: attributeDifferences!.waistDirection,
              sleevesDirection: attributeDifferences!.sleevesDirection,
              sleeves: attributeDifferences!.sleeves,
            )
          : AttributeDifferencesEntity(
              bust: '',
              bustDirection: null,
              waist: '',
              waistDirection: null,
              sleevesDirection: null,
              sleeves: null,
            ),
      recommendedSize: recommendedSize ?? '',
      fitType: fitType ?? '',
      similarProducts: similarProducts
          .map((sp) => SimilarProductEntity(
                id: sp.id ?? '',
                name: sp.name ?? '',
                price: sp.price ?? '',
                primaryImage: sp.primaryImage ?? '',
                isWishlist: sp.isWishlist ?? false,
              ))
          .toList(),
      product: ProductEntity(
          id: product?.id ?? '',
          brand: product?.brand ?? '',
          category: product?.category ?? '',
          name: product?.name ?? '',
          url: product?.url ?? '',
          description: product?.description ?? '',
          price: product?.price ?? '',
          sizes: product?.sizes != null
              ? product!.sizes
                  .map((sizeModel) => ProductSizeEntity(
                        id: sizeModel.id ?? '',
                        size: sizeModel.size ?? '',
                        inStock: sizeModel.inStock ?? false,
                      ))
                  .toList()
              : [],
          gender: product?.gender ?? '',
          rating: product?.rating,
          reviewCount: product?.reviewCount,
          createdAt:
              product?.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
          updatedAt:
              product?.updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
          image: ProductImageEntity(
            primary: product?.image?.primary ?? '',
            secondary: product?.image?.secondary != null
                ? List<String>.from(product!.image!.secondary)
                : [],
          )),
    );
  }
}
