class SearchSuggestionsResponseModel {
  SearchSuggestionsResponseModel({
    required this.suggestions,
  });

  final List<Suggestion> suggestions;

  factory SearchSuggestionsResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchSuggestionsResponseModel(
      suggestions: json["suggestions"] == null
          ? []
          : List<Suggestion>.from(
              json["suggestions"]!.map((x) => Suggestion.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "suggestions": suggestions.map((x) => x.toJson()).toList(),
      };
}

class Suggestion {
  Suggestion({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      id: json["_id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
