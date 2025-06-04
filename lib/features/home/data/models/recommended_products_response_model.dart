class RecommendedProductsResponseModel {
  RecommendedProductsResponseModel({
    required this.pageSize,
    required this.totalMatched,
    required this.productsPerBrand,
    required this.productsProcessed,
    required this.nextSkip,
    required this.data,
  });

  final String? pageSize;
  final int? totalMatched;
  final int? productsPerBrand;
  final NextSkip? productsProcessed;
  final NextSkip? nextSkip;
  final Data? data;

  factory RecommendedProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return RecommendedProductsResponseModel(
      pageSize: json["pageSize"],
      totalMatched: json["totalMatched"],
      productsPerBrand: json["productsPerBrand"],
      productsProcessed: json["productsProcessed"] == null
          ? null
          : NextSkip.fromJson(json["productsProcessed"]),
      nextSkip:
          json["nextSkip"] == null ? null : NextSkip.fromJson(json["nextSkip"]),
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "totalMatched": totalMatched,
        "productsPerBrand": productsPerBrand,
        "productsProcessed": productsProcessed?.toJson(),
        "nextSkip": nextSkip?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.products,
  });

  final List<ProductElement> products;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      products: json["products"] == null
          ? []
          : List<ProductElement>.from(
              json["products"]!.map((x) => ProductElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "products": products.map((x) => x.toJson()).toList(),
      };
}

class ProductElement {
  ProductElement({
    required this.product,
    required this.alterationRequired,
    required this.isWishlist,
  });

  final ProductProduct? product;
  final bool? alterationRequired;
  final bool? isWishlist;

  factory ProductElement.fromJson(Map<String, dynamic> json) {
    return ProductElement(
      product: json["product"] == null
          ? null
          : ProductProduct.fromJson(json["product"]),
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

class ProductProduct {
  ProductProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  final String? id;
  final String? name;
  final String? price;
  final Image? image;

  factory ProductProduct.fromJson(Map<String, dynamic> json) {
    return ProductProduct(
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

class NextSkip {
  NextSkip({
    required this.ebDenim,
    required this.agolde,
    required this.selfPotrait,
    required this.jCrew,
    required this.lululemon,
    required this.reformation,
    required this.houseOfCb,
  });

  final int? ebDenim;
  final int? agolde;
  final int? selfPotrait;
  final int? jCrew;
  final int? lululemon;
  final int? reformation;
  final int? houseOfCb;

  factory NextSkip.fromJson(Map<String, dynamic> json) {
    return NextSkip(
      ebDenim: json["EB_Denim"],
      agolde: json["Agolde"],
      selfPotrait: json["Self_Potrait"],
      jCrew: json["J_Crew"],
      lululemon: json["Lululemon"],
      reformation: json["Reformation"],
      houseOfCb: json["House_Of_CB"],
    );
  }

  Map<String, dynamic> toJson() => {
        "EB_Denim": ebDenim,
        "Agolde": agolde,
        "Self_Potrait": selfPotrait,
        "J_Crew": jCrew,
        "Lululemon": lululemon,
        "Reformation": reformation,
        "House_Of_CB": houseOfCb,
      };
}
