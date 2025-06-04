import 'package:fitted/core/network/api_client.dart';
import 'package:fitted/features/home/data/models/trending_products_response_model.dart';

import '../models/recommended_products_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<TrendingProductsResponseModel> getTrendingProducts();
  Future<RecommendedProductsResponseModel> getRecommendedProducts(
      String fitType);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;
  HomeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<TrendingProductsResponseModel> getTrendingProducts() async {
    final response = await apiClient.get('/api/product/trending');
    return TrendingProductsResponseModel.fromJson(response.data);
  }

  @override
  Future<RecommendedProductsResponseModel> getRecommendedProducts(
      String fitType) async {
    final response = await apiClient.get(
        '/api/product/recommended?brands=Self_Potrait,J_Crew,Lululemon,Reformation,House_Of_CB,EB_Denim,Agolde,&PAGE_SIZE=6&fitType=$fitType');
    return RecommendedProductsResponseModel.fromJson(response.data);
  }
}
