// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class MeasurementState extends Equatable {
  final int currentIndex;
  final String style;
  final String fit;
  final FemaleMeasurementModel femaleMeasurementModel;
  final MaleMeasurementModel maleMeasurementModel;
  final OtherMeasurementModel otherMeasurementModel;
  final bool isSuccess;
  final bool isLoading;

  const MeasurementState(
      {required this.currentIndex,
      required this.style,
      required this.fit,
      required this.femaleMeasurementModel,
      required this.otherMeasurementModel,
      required this.isLoading,
      required this.isSuccess,
      required this.maleMeasurementModel});

  @override
  List<Object?> get props => [
        style,
        fit,
        isLoading,
        isSuccess,
        currentIndex,
        femaleMeasurementModel,
        maleMeasurementModel,
        otherMeasurementModel
      ];

  MeasurementState copyWith({
    String? style,
    String? fit,
    XFile? image,
    int? currentIndex,
    bool? isLoading,
    bool? isSuccess,
    FemaleMeasurementModel? femaleMeasurementModel,
    MaleMeasurementModel? maleMeasurementModel,
    OtherMeasurementModel? otherMeasurementModel,
  }) {
    return MeasurementState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      style: style ?? this.style,
      fit: fit ?? this.fit,
      currentIndex: currentIndex ?? this.currentIndex,
      femaleMeasurementModel:
          femaleMeasurementModel ?? this.femaleMeasurementModel,
      maleMeasurementModel: maleMeasurementModel ?? this.maleMeasurementModel,
      otherMeasurementModel:
          otherMeasurementModel ?? this.otherMeasurementModel,
    );
  }
}
