// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

abstract class ApparelEvent {
  const ApparelEvent();
}

class GetApparelEvent extends ApparelEvent {}

class SetCategory extends ApparelEvent {
  final String category;
  SetCategory({
    required this.category,
  });
}

class SetBrand extends ApparelEvent {
  final String brand;
  SetBrand({
    required this.brand,
  });
}

class LoadMoreCategoryProducts extends ApparelEvent {}

class WishList extends ApparelEvent {
  final String productId;
  final bool isAdded;
  final bool skip;
  WishList({
    required this.productId,
    required this.isAdded,
    this.skip = false,
  });
}

class SearchQuery extends ApparelEvent {
  final String query;
  SearchQuery({
    required this.query,
  });
}

class SearchProducts extends ApparelEvent {
  final String keyword;
  SearchProducts({
    required this.keyword,
  });
}
