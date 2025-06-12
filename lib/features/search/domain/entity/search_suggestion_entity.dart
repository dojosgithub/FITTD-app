// entity
import '../../data/model/search_suggestions_response_model.dart';

class SuggestionEntity {
  final String id;
  final String name;

  SuggestionEntity({
    required this.id,
    required this.name,
  });
}

// single suggestion to entity
extension SuggestionModelMapper on Suggestion {
  SuggestionEntity toEntity() {
    return SuggestionEntity(
      id: id ?? '',
      name: name ?? '',
    );
  }
}

// full response model to list of entities
extension SuggestionResponseMapper on SearchSuggestionsResponseModel {
  List<SuggestionEntity> toEntityList() {
    return suggestions.map((s) => s.toEntity()).toList();
  }
}
