import 'package:fitted/core/network/api_client.dart';
import 'package:fitted/features/search/data/model/search_products_response_model.dart';
import '../model/search_suggestions_response_model.dart';

abstract class SearchRemoteDataSource {
  Future<SearchSuggestionsResponseModel> getSearchSuggestions(
      String suggestion);
  Future<SearchProductsResponseModel> getSearchProducts({
    bool? isStandard,
    required String keyword,
    required String fitType,
  });
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiClient apiClient;
  SearchRemoteDataSourceImpl(this.apiClient);
  @override
  Future<SearchSuggestionsResponseModel> getSearchSuggestions(
      String suggestion) async {
    final response =
        await apiClient.get('/api/product/suggestion?searchText=$suggestion');
    return SearchSuggestionsResponseModel.fromJson(response.data);
  }

  @override
  Future<SearchProductsResponseModel> getSearchProducts({
    required String keyword,
    bool? isStandard,
    required String fitType,
  }) async {
    final response = await apiClient.get((isStandard ?? false)
        ? '/api/product/search?keyword=$keyword'
        : '/api/product/search?fitType=$fitType&keyword=$keyword');

    return SearchProductsResponseModel.fromJson(response.data);
  }
}
