// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'bloc.dart';

class MeasurementEvent {}

class ChangeUnit extends MeasurementEvent {
  final Unit selectedUnit;
  ChangeUnit({required this.selectedUnit});
}

class UpdateMeasurement extends MeasurementEvent {
  final Object field;
  final Measurement value;

  UpdateMeasurement({required this.field, required this.value});
}

class SelectFit extends MeasurementEvent {
  final String fit;
  SelectFit({required this.fit});
}

class SelectStyle extends MeasurementEvent {
  final String style;
  SelectStyle({required this.style});
}

class IncrementIndex extends MeasurementEvent {}

class OnboardUser extends MeasurementEvent {}
