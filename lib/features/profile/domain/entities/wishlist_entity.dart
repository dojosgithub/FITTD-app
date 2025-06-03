import 'package:equatable/equatable.dart';

class WishlistEntity extends Equatable {
  final List<Product> items;

  const WishlistEntity({required this.items});

  WishlistEntity copyWith({List<Product>? items}) {
    return WishlistEntity(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}

class Product extends Equatable {
  final String id;
  final String name;
  final String price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, price, imageUrl];
}
