class TrendingProductsResponseModel {
  TrendingProductsResponseModel({
    required this.data,
  });

  final List<Datum> data;

  factory TrendingProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return TrendingProductsResponseModel(
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
    required this.name,
    required this.price,
    required this.image,
    required this.clickCount,
    required this.isWishlist,
  });

  final String? id;
  final String? name;
  final String? price;
  final Image? image;
  final int? clickCount;
  final bool? isWishlist;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["_id"],
      name: json["name"],
      price: json["price"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      clickCount: json["clickCount"],
      isWishlist: json["isWishlist"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "image": image?.toJson(),
        "clickCount": clickCount,
        "isWishlist": isWishlist,
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
