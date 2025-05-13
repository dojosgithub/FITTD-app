import 'package:fitted/features/onboarding/data/models/measurement_model.dart';
import 'package:fitted/features/onboarding/data/models/onboarding_request_model.dart';

import '../../domain/entities/onboarding_entity.dart';

class OnboardingResponseModel {
  final OnboardingEntity data;
  final String message;

  OnboardingResponseModel({required this.data, required this.message});

  factory OnboardingResponseModel.fromJson(Map<String, dynamic> json) {
    return OnboardingResponseModel(
      data: MeasurementEntityMapper.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class MeasurementEntityMapper {
  static OnboardingEntity fromJson(Map<String, dynamic> json) {
    return OnboardingEntity(
      id: json['_id'],
      userId: json['userId'],
      gender: json['gender'],
      fit: json['fit'],
      height: Measurement(
        value: (json['height']['value'] as num).toDouble(),
        unit: json['height']['unit'],
      ),
      upperBody: UpperBodyMeasurement.fromMap(json['upperBody']),
      lowerBody: LowerBodyMeasurement.fromMap(json['lowerBody']),
      footMeasurement: FootMeasurement.fromMap(json['footMeasurement']),
      handMeasurement: HandMeasurement.fromMap(json['handMeasurement']),
      headMeasurement: HeadMeasurement.fromMap(json['headMeasurement']),
      faceMeasurement: FaceMeasurement.fromMap(json['faceMeasurement']),
    );
  }
}
