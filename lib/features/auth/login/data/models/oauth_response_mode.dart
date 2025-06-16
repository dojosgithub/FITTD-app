class OAuthResponseModel {
  OAuthResponseModel({
    required this.user,
    required this.tokens,
  });

  final User? user;
  final Tokens? tokens;

  factory OAuthResponseModel.fromJson(Map<String, dynamic> json) {
    return OAuthResponseModel(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      tokens: json["tokens"] == null ? null : Tokens.fromJson(json["tokens"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "tokens": tokens?.toJson(),
      };
}

class Tokens {
  Tokens({
    required this.accessToken,
  });

  final String? accessToken;

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      accessToken: json["accessToken"],
    );
  }

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
      };
}

class User {
  User({
    required this.fcmToken,
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.isVerified,
    required this.accountType,
    required this.measurements,
    required this.createdAt,
    required this.updatedAt,
  });

  final dynamic fcmToken;
  final String? id;
  final String? name;
  final String? email;
  final String? image;
  final bool? isVerified;
  final String? accountType;
  final dynamic measurements;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fcmToken: json["fcmToken"],
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      image: json["image"],
      isVerified: json["isVerified"],
      accountType: json["accountType"],
      measurements: json["measurements"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "fcmToken": fcmToken,
        "_id": id,
        "name": name,
        "email": email,
        "image": image,
        "isVerified": isVerified,
        "accountType": accountType,
        "measurements": measurements,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
