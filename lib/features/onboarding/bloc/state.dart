// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class OnboardingState extends Equatable {
  final int currentIndex;
  final String style;
  final String fit;
  final FemaleMeasurementModel measurements;

  const OnboardingState({
    required this.currentIndex,
    required this.style,
    required this.fit,
    required this.measurements,
  });

  @override
  List<Object?> get props => [style, fit, currentIndex, measurements];

  OnboardingState copyWith({
    String? style,
    String? fit,
    int? currentIndex,
    FemaleMeasurementModel? measurements,
  }) {
    return OnboardingState(
      style: style ?? this.style,
      fit: fit ?? this.fit,
      currentIndex: currentIndex ?? this.currentIndex,
      measurements: measurements ?? this.measurements,
    );
  }
}
