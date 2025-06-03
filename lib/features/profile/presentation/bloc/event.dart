// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "bloc.dart";

class ProfileEvent {}

class GetProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {}

class DeleteProfile extends ProfileEvent {}

class PickFromCamera extends ProfileEvent {}

class PickFromGallery extends ProfileEvent {}

class ClearImage extends ProfileEvent {}

class GetWishlist extends ProfileEvent {}

class RemoveFromWishlist extends ProfileEvent {
  final int index;
  RemoveFromWishlist({
    required this.index,
  });
}
