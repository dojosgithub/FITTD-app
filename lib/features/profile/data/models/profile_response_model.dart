class ProfileResponseModel {
  ProfileResponseModel({
    required this.data,
    required this.message,
  });

  final Data? data;
  final String? message;

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.wishlist,
  });

  final String? id;
  final String? name;
  final String? email;
  final dynamic image;
  final List<String> wishlist;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      image: json["image"],
      wishlist: json["wishlist"] == null
          ? []
          : List<String>.from(json["wishlist"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "image": image,
        "wishlist": wishlist.map((x) => x).toList(),
      };
}
