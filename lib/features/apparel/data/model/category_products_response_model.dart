class CategoryProductsResponseModel {
  CategoryProductsResponseModel({
    required this.results,
    required this.data,
  });

  final int? results;
  final Data? data;

  factory CategoryProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryProductsResponseModel(
      results: json["results"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "results": results,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.productsByCategory,
  });

  final Map<String, List<Denim>> productsByCategory;

  factory Data.fromJson(Map<String, dynamic> json) {
    final map = <String, List<Denim>>{};

    json.forEach((key, value) {
      if (value is List) {
        map[key] = value.map((item) => Denim.fromJson(item)).toList();
      }
    });

    return Data(productsByCategory: map);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    productsByCategory.forEach((key, value) {
      map[key] = value.map((item) => item.toJson()).toList();
    });
    return map;
  }
}

class Denim {
  Denim({
    required this.id,
    required this.brand,
    required this.category,
    required this.name,
    required this.price,
    required this.image,
    required this.isWishlist,
  });

  final String? id;
  final String? brand;
  final String? category;
  final String? name;
  final String? price;
  final ProductImage? image;
  final bool? isWishlist;

  factory Denim.fromJson(Map<String, dynamic> json) {
    return Denim(
      id: json["_id"],
      brand: json["brand"],
      category: json["category"],
      name: json["name"],
      price: json["price"],
      image:
          json["image"] == null ? null : ProductImage.fromJson(json["image"]),
      isWishlist: json["isWishlist"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "brand": brand,
        "category": category,
        "name": name,
        "price": price,
        "image": image?.toJson(),
        "isWishlist": isWishlist,
      };
}

class ProductImage {
  ProductImage({
    required this.primary,
  });

  final String? primary;

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      primary: json["primary"],
    );
  }

  Map<String, dynamic> toJson() => {
        "primary": primary,
      };
}
