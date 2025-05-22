part of "bloc.dart";

class ProfileState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final Profile profile;
  final XFile? image;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController emailName;
  const ProfileState({
    required this.isLoading,
    required this.isSuccess,
    required this.profile,
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
      bool clearImage = false}) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      profile: profile ?? this.profile,
      image: clearImage ? null : (image ?? this.image),
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailName: emailName ?? this.emailName,
    );
  }
}
