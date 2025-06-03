class ProductDetailResponseModel {
  ProductDetailResponseModel({
    required this.product,
    required this.alterationRequired,
    required this.attributeDifferences,
    required this.recommendedSize,
    required this.fitType,
    required this.similarProducts,
  });

  final Product? product;
  final bool? alterationRequired;
  final AttributeDifferences? attributeDifferences;
  final String? recommendedSize;
  final String? fitType;
  final List<SimilarProduct> similarProducts;

  factory ProductDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailResponseModel(
      product:
          json["product"] == null ? null : Product.fromJson(json["product"]),
      alterationRequired: json["alterationRequired"],
      attributeDifferences: json["attributeDifferences"] == null
          ? null
          : AttributeDifferences.fromJson(json["attributeDifferences"]),
      recommendedSize: json["recommendedSize"],
      fitType: json["fitType"],
      similarProducts: json["similarProducts"] == null
          ? []
          : List<SimilarProduct>.from(
              json["similarProducts"]!.map((x) => SimilarProduct.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "alterationRequired": alterationRequired,
        "attributeDifferences": attributeDifferences?.toJson(),
        "recommendedSize": recommendedSize,
        "fitType": fitType,
        "similarProducts": similarProducts.map((x) => x.toJson()).toList(),
      };
}

class AttributeDifferences {
  AttributeDifferences({
    required this.bust,
    required this.bustDirection,
    required this.waist,
    required this.waistDirection,
    required this.sleevesDirection,
    required this.sleeves,
  });

  final String? bust;
  final dynamic bustDirection;
  final String? waist;
  final String? waistDirection;
  final dynamic sleevesDirection;
  final dynamic sleeves;

  factory AttributeDifferences.fromJson(Map<String, dynamic> json) {
    return AttributeDifferences(
      bust: json["bust"],
      bustDirection: json["bustDirection"],
      waist: json["waist"],
      waistDirection: json["waistDirection"],
      sleevesDirection: json["sleevesDirection"],
      sleeves: json["sleeves"],
    );
  }

  Map<String, dynamic> toJson() => {
        "bust": bust,
        "bustDirection": bustDirection,
        "waist": waist,
        "waistDirection": waistDirection,
        "sleevesDirection": sleevesDirection,
        "sleeves": sleeves,
      };
}

class Product {
  Product({
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
    required this.rating,
    required this.reviewCount,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? brand;
  final String? category;
  final String? name;
  final String? url;
  final String? description;
  final String? price;
  final Image? image;
  final List<Size> sizes;
  final String? gender;
  final dynamic rating;
  final dynamic reviewCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["_id"],
      brand: json["brand"],
      category: json["category"],
      name: json["name"],
      url: json["url"],
      description: json["description"],
      price: json["price"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      sizes: json["sizes"] == null
          ? []
          : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
      gender: json["gender"],
      rating: json["rating"],
      reviewCount: json["reviewCount"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "brand": brand,
        "category": category,
        "name": name,
        "url": url,
        "description": description,
        "price": price,
        "image": image?.toJson(),
        "sizes": sizes.map((x) => x.toJson()).toList(),
        "gender": gender,
        "rating": rating,
        "reviewCount": reviewCount,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Image {
  Image({
    required this.primary,
    required this.secondary,
  });

  final String? primary;
  final List<String> secondary;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      primary: json["primary"],
      secondary: json["secondary"] == null
          ? []
          : List<String>.from(json["secondary"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary.map((x) => x).toList(),
      };
}

class Size {
  Size({
    required this.size,
    required this.inStock,
    required this.id,
  });

  final String? size;
  final bool? inStock;
  final String? id;

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      size: json["size"],
      inStock: json["inStock"],
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "size": size,
        "inStock": inStock,
        "_id": id,
      };
}

class SimilarProduct {
  SimilarProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.primaryImage,
    required this.isWishlist,
  });

  final String? id;
  final String? name;
  final String? price;
  final String? primaryImage;
  final bool? isWishlist;

  factory SimilarProduct.fromJson(Map<String, dynamic> json) {
    return SimilarProduct(
      id: json["_id"],
      name: json["name"],
      price: json["price"],
      primaryImage: json["primaryImage"],
      isWishlist: json["isWishlist"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "primaryImage": primaryImage,
        "isWishlist": isWishlist,
      };
}
