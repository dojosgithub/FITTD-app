// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class ProductEvent {}

class GetProductDetails extends ProductEvent {
  final String productId;
  GetProductDetails({
    required this.productId,
  });
}

class AddClick extends ProductEvent {
  final String productId;
  AddClick({
    required this.productId,
  });
}

class WishList extends ProductEvent {
  final String productId;
  final bool isAdded;
  WishList({
    required this.productId,
    required this.isAdded,
  });
}
