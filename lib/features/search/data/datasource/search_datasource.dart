import 'package:fitted/core/network/api_client.dart';
import '../model/search_suggestions_response_model.dart';

abstract class SearchRemoteDataSource {
  Future<SearchSuggestionsResponseModel> getSearchSuggestions(
      String suggestion);
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
}
