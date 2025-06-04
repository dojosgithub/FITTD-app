// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class HomeEvent {}

class GetTrendingProducts extends HomeEvent {}

class GetRecommendedProducts extends HomeEvent {
  final String fitType;
  GetRecommendedProducts({
    required this.fitType,
  });
}

class EditWishlist extends HomeEvent {
  final int index;
  final bool isTrending;
  EditWishlist({
    required this.index,
    this.isTrending = true,
  });
}
