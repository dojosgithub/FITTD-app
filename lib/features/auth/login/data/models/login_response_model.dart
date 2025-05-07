class LoginResponseModel {
  LoginResponseModel({
    required this.data,
    required this.message,
  });

  final Data? data;
  final String? message;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
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
    required this.user,
    required this.tokens,
  });

  final User? user;
  final Tokens? tokens;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
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
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.isVerified,
    required this.measurements,
  });

  final String? id;
  final String? name;
  final String? email;
  final dynamic image;
  final bool? isVerified;
  final dynamic measurements;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      image: json["image"],
      isVerified: json["isVerified"],
      measurements: json["measurements"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "image": image,
        "isVerified": isVerified,
        "measurements": measurements,
      };
}
