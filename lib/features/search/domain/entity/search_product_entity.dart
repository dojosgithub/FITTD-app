import 'package:fitted/features/search/data/model/search_products_response_model.dart';

class SearchProductEntity {
  final String id;
  final String name;
  final String price;
  final String imageUrl;
  final bool alterationRequired;
  final bool isWishlist;

  SearchProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.alterationRequired,
    required this.isWishlist,
  });
}

extension SearchProductsResponseMapper on SearchProductsResponseModel {
  List<SearchProductEntity> toEntityList() {
    return data.map((datum) {
      final product = datum.product;
      return SearchProductEntity(
        id: product?.id ?? '',
        name: product?.name?.replaceAll(RegExp(r'\s+'), ' ').trim() ?? '',
        price: product?.price ?? '',
        imageUrl: product?.image?.primary ?? '',
        alterationRequired: datum.alterationRequired ?? false,
        isWishlist: datum.isWishlist ?? false,
      );
    }).toList();
  }
}
