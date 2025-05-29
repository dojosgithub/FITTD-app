// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

abstract class ApparelEvent {
  const ApparelEvent();
}

class GetApparelEvent extends ApparelEvent {
  final String? brand;

  const GetApparelEvent({this.brand});
}

class SetCategory extends ApparelEvent {
  final String category;
  SetCategory({
    required this.category,
  });
}
