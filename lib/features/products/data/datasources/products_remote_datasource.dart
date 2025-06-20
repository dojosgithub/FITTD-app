import 'package:fitted/core/network/api_client.dart';
import '../model/products_detail_response_model.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductDetailResponseModel> getProductDetailsGuest(
      {required String id, required String userId});
  Future<dynamic> addClick({required String id});
  Future<dynamic> wishList({required String id, required bool isAdded});
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ApiClient apiClient;

  ProductsRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ProductDetailResponseModel> getProductDetailsGuest(
      {required String id, required String userId}) async {
    final response = await apiClient
        .get('/api/product/get-product-details?productId=$id&userId=$userId');

    return ProductDetailResponseModel.fromJson(response.data);
  }

  @override
  Future<dynamic> addClick({required String id}) async {
    final response = await apiClient.post('/api/product/click?productId=$id');

    return response.data;
  }

  @override
  Future<dynamic> wishList({required String id, required bool isAdded}) async {
    final response = isAdded
        ? await apiClient.delete(
            '/api/wishlist/remove',
            data: {
              "productId": id,
            },
          )
        : await apiClient.post(
            '/api/wishlist/add',
            data: {
              "productId": id,
            },
          );

    return response.data;
  }
}
