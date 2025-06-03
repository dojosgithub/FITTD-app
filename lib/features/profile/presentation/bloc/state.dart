// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "bloc.dart";

class ProfileState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final Profile profile;
  final WishlistEntity? wishlistEntity;
  final XFile? image;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController emailName;
  const ProfileState({
    required this.isLoading,
    required this.isSuccess,
    required this.profile,
    required this.wishlistEntity,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.emailName,
  });

  @override
  List<Object?> get props {
    return [
      isLoading,
      isSuccess,
      profile,
      firstName,
      lastName,
      emailName,
      image,
      wishlistEntity
    ];
  }

  ProfileState copyWith(
      {bool? isLoading,
      bool? isSuccess,
      Profile? profile,
      XFile? image,
      TextEditingController? firstName,
      TextEditingController? lastName,
      TextEditingController? emailName,
      WishlistEntity? wishlistEntity,
      bool clearImage = false}) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      profile: profile ?? this.profile,
      image: clearImage ? null : (image ?? this.image),
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      wishlistEntity: wishlistEntity ?? this.wishlistEntity,
      emailName: emailName ?? this.emailName,
    );
  }
}
