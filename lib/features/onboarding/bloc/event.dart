part of 'bloc.dart';

class OnboardingEvent {}

class ChangeUnit extends OnboardingEvent {
  final Unit selectedUnit;
  ChangeUnit({required this.selectedUnit});
}

class ChangeHeight extends OnboardingEvent {
  final num height;
  ChangeHeight({required this.height});
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
