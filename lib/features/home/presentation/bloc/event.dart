// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class HomeEvent {}

class GetTrendingProducts extends HomeEvent {}

class GetRecommendedProducts extends HomeEvent {}

class EditWishlist extends HomeEvent {
  final int index;
  EditWishlist({required this.index});
}
