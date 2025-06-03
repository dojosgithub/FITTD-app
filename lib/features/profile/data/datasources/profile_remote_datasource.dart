import 'package:fitted/features/profile/data/models/update_profile_request_model.dart';

import '../../../../core/network/api_client.dart';
import '../models/profile_response_model.dart';
import '../models/wishlist_response_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponseModel> getProfile();
  Future<ProfileResponseModel> updateProfile(UpdateProfileRequestModel request);
  Future<WishlistResponseModel> getWishlist();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient apiClient;

  ProfileRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ProfileResponseModel> getProfile() async {
    final response = await apiClient.get('/api/user/profile');

    return ProfileResponseModel.fromJson(response.data);
  }

  @override
  Future<ProfileResponseModel> updateProfile(
      UpdateProfileRequestModel request) async {
    final formData = await request.toFormData();
    final response = await apiClient.putMultipart(
      '/api/user/profile/details',
      formData: formData,
    );

    return ProfileResponseModel.fromJson(response.data);
  }

  @override
  Future<WishlistResponseModel> getWishlist() async {
    final response = await apiClient.get('/api/wishlist/');

    return WishlistResponseModel.fromJson(response.data);
  }
}
