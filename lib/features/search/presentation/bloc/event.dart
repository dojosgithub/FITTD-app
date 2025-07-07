// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class SearchEvent {}

class SearchQuery extends SearchEvent {
  final String query;
  SearchQuery({
    required this.query,
  });
}

class SearchProducts extends SearchEvent {
  final String keyword;
  SearchProducts({
    required this.keyword,
  });
}

class SelectFilter extends SearchEvent {
  final int selectedIndex;
  SelectFilter({
    required this.selectedIndex,
  });
}

class SelectFit extends SearchEvent {
  final String fit;
  SelectFit({
    required this.fit,
  });
}

class Reset extends SearchEvent {}
