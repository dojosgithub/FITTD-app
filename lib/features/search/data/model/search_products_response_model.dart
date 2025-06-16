class SearchProductsResponseModel {
  SearchProductsResponseModel({
    required this.total,
    required this.data,
  });

  final int? total;
  final List<Datum> data;

  factory SearchProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchProductsResponseModel(
      total: json["total"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Datum {
  Datum({
    required this.product,
    required this.alterationRequired,
    required this.isWishlist,
  });

  final Product? product;
  final bool? alterationRequired;
  final bool? isWishlist;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      product:
          json["product"] == null ? null : Product.fromJson(json["product"]),
      alterationRequired: json["alterationRequired"],
      isWishlist: json["isWishlist"],
    );
  }

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "alterationRequired": alterationRequired,
        "isWishlist": isWishlist,
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  final String? id;
  final String? name;
  final String? price;
  final Image? image;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["_id"],
      name: json["name"],
      price: json["price"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "image": image?.toJson(),
      };
}

class Image {
  Image({
    required this.primary,
  });

  final String? primary;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      primary: json["primary"],
    );
  }

  Map<String, dynamic> toJson() => {
        "primary": primary,
      };
}
