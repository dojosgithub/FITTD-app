import 'package:fitted/features/apparel/data/model/apparel_response_model.dart';

import '../../../../core/network/api_client.dart';
import '../model/category_products_response_model.dart';

abstract class ApparelRemoteDataSource {
  Future<ApparelResponseModel> getApparel({String? brand});
  Future<CategoryProductsResponseModel> getCategoryProducts(
      {String? brand, required String category, required int page});
}

class ApparelRemoteDataSourceImpl implements ApparelRemoteDataSource {
  final ApiClient apiClient;

  ApparelRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ApparelResponseModel> getApparel({String? brand}) async {
    final response = await apiClient.get(
      brand == "" || brand == null
          ? '/api/product/get-categories-count'
          : '/api/product/get-categories-count?brand=$brand',
    );

    return ApparelResponseModel.fromJson(response.data);
  }

  @override
  Future<CategoryProductsResponseModel> getCategoryProducts(
      {String? brand, required String category, required int page}) async {
    final response = await apiClient.get(
      brand == "" || brand == null
          ? '/api/product/brands-and-categories?category=${category.toLowerCase()}&page=$page&brand=EB_Denim,Agolde,Self_Potrait, J_Crew, Lululemon, Reformation,House_Of_CB'
          : '/api/product/brands-and-categories?brand=$brand&category=$category&page=$page',
    );

    return CategoryProductsResponseModel.fromJson(response.data);
  }
}
