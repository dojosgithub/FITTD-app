// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'bloc.dart';

class OnboardingEvent {}

class ChangeUnit extends OnboardingEvent {
  final Unit selectedUnit;
  ChangeUnit({required this.selectedUnit});
}

class UpdateMeasurement extends OnboardingEvent {
  final Object field;
  final Measurement value;

  UpdateMeasurement({required this.field, required this.value});
}

class SelectFit extends OnboardingEvent {
  final String fit;
  SelectFit({required this.fit});
}

class SelectStyle extends OnboardingEvent {
  final String style;
  SelectStyle({required this.style});
}

class IncrementIndex extends OnboardingEvent {}
