class WishlistResponseModel {
  WishlistResponseModel({
    required this.data,
  });

  final List<Datum> data;

  factory WishlistResponseModel.fromJson(Map<String, dynamic> json) {
    return WishlistResponseModel(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? userId;
  final Product? product;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["_id"],
      userId: json["userId"],
      product:
          json["product"] == null ? null : Product.fromJson(json["product"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "product": product?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Product {
  Product({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
  });

  final Image? image;
  final String? id;
  final String? name;
  final String? price;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      id: json["_id"],
      name: json["name"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "image": image?.toJson(),
        "_id": id,
        "name": name,
        "price": price,
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
