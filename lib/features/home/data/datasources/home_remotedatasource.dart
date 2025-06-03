import 'package:fitted/core/network/api_client.dart';
import 'package:fitted/features/home/data/models/trending_products_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<TrendingProductsResponseModel> getTrendingProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;
  HomeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<TrendingProductsResponseModel> getTrendingProducts() async {
    final response = await apiClient.get('/api/product/trending');
    return TrendingProductsResponseModel.fromJson(response.data);
  }
}
