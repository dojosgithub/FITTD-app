// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class OnboardingState extends Equatable {
  final Unit selectedUnit;
  final num heightCm;
  final num heightIn;
  final int currentIndex;
  final String style;
  final String fit;
  const OnboardingState({
    required this.currentIndex,
    required this.selectedUnit,
    required this.heightCm,
    required this.heightIn,
    required this.style,
    required this.fit,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [selectedUnit, heightCm, heightIn, style, fit, currentIndex];

  OnboardingState copyWith({
    Unit? selectedUnit,
    num? heightCm,
    num? heightIn,
    String? style,
    String? fit,
    int? currentIndex,
  }) {
    return OnboardingState(
      selectedUnit: selectedUnit ?? this.selectedUnit,
      heightCm: heightCm ?? this.heightCm,
      heightIn: heightIn ?? this.heightIn,
      style: style ?? this.style,
      fit: fit ?? this.fit,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
