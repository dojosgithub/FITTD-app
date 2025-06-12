// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class SearchEvent {}

class SearchQuery extends SearchEvent {
  final String query;
  SearchQuery({
    required this.query,
  });
}
