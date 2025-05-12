// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class OnboardingState extends Equatable {
  final int currentIndex;
  final String style;
  final String fit;
  final FemaleMeasurementModel femaleMeasurementModel;
  final MaleMeasurementModel maleMeasurementModel;

  const OnboardingState(
      {required this.currentIndex,
      required this.style,
      required this.fit,
      required this.femaleMeasurementModel,
      required this.maleMeasurementModel});

  @override
  List<Object?> get props =>
      [style, fit, currentIndex, femaleMeasurementModel, maleMeasurementModel];

  OnboardingState copyWith({
    String? style,
    String? fit,
    int? currentIndex,
    FemaleMeasurementModel? femaleMeasurementModel,
    MaleMeasurementModel? maleMeasurementModel,
  }) {
    return OnboardingState(
      style: style ?? this.style,
      fit: fit ?? this.fit,
      currentIndex: currentIndex ?? this.currentIndex,
      femaleMeasurementModel:
          femaleMeasurementModel ?? this.femaleMeasurementModel,
      maleMeasurementModel: maleMeasurementModel ?? this.maleMeasurementModel,
    );
  }
}
