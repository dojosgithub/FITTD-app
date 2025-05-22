class ProfileResponseEntity {
  final Profile? profile;
  final String? message;

  ProfileResponseEntity({
    required this.profile,
    required this.message,
  });
}

class Profile {
  final String? id;
  final String? name;
  final String? email;
  final String? imageUrl;
  final List<String>? wishlist;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.wishlist,
  });
}
