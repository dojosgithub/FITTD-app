import '../../data/models/measurement_model.dart';
import '../../data/models/onboarding_request_model.dart';

class OnboardingEntity {
  final String id;
  final String userId;
  final String gender;
  final String fit;
  final Measurement height;
  final UpperBodyMeasurement upperBody;
  final LowerBodyMeasurement lowerBody;
  final FootMeasurement footMeasurement;
  final HandMeasurement handMeasurement;
  final HeadMeasurement headMeasurement;
  final FaceMeasurement faceMeasurement;

  OnboardingEntity({
    required this.id,
    required this.userId,
    required this.gender,
    required this.fit,
    required this.height,
    required this.upperBody,
    required this.lowerBody,
    required this.footMeasurement,
    required this.handMeasurement,
    required this.headMeasurement,
    required this.faceMeasurement,
  });

  factory OnboardingEntity.fromMap(Map<String, dynamic> map) {
    final data = map['data'];
    return OnboardingEntity(
      id: data['_id'],
      userId: data['userId'],
      gender: data['gender'],
      fit: data['fit'],
      height: Measurement.fromMap(data['height']),
      upperBody: UpperBodyMeasurement.fromMap(data['upperBody']),
      lowerBody: LowerBodyMeasurement.fromMap(data['lowerBody']),
      footMeasurement: FootMeasurement.fromMap(data['footMeasurement']),
      handMeasurement: HandMeasurement.fromMap(data['handMeasurement']),
      headMeasurement: HeadMeasurement.fromMap(data['headMeasurement']),
      faceMeasurement: FaceMeasurement.fromMap(data['faceMeasurement']),
    );
  }

  Map<String, dynamic> toMap() => {
        'gender': gender,
        'fit': fit,
        'height': height.toMap(),
        'upperBody': upperBody.toMap(),
        'lowerBody': lowerBody.toMap(),
        'footMeasurement': footMeasurement.toMap(),
        'handMeasurement': handMeasurement.toMap(),
        'headMeasurement': headMeasurement.toMap(),
        'faceMeasurement': faceMeasurement.toMap(),
      };
}
