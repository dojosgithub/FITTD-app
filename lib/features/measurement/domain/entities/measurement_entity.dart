import '../../data/models/measurement_model.dart';
import '../../data/models/measurement_request_model.dart';

class MeasurementEntity {
  final String? gender;
  final String? fit;
  final Measurement? height;
  final UpperBodyMeasurement? upperBody;
  final LowerBodyMeasurement? lowerBody;
  final FootMeasurement? footMeasurement;
  final HandMeasurement? handMeasurement;
  final HeadMeasurement? headMeasurement;
  final FaceMeasurement? faceMeasurement;

  MeasurementEntity({
    this.gender,
    this.fit,
    this.height,
    this.upperBody,
    this.lowerBody,
    this.footMeasurement,
    this.handMeasurement,
    this.headMeasurement,
    this.faceMeasurement,
  });

  factory MeasurementEntity.fromMap(Map<String, dynamic> map) {
    final data = map['data'];
    if (data == null || data is! Map<String, dynamic>) {
      throw Exception('Invalid data format');
    }

    return MeasurementEntity(
      gender: data['gender'],
      fit: data['fit'],
      height:
          data['height'] != null ? Measurement.fromMap(data['height']) : null,
      upperBody: data['upperBody'] != null
          ? UpperBodyMeasurement.fromMap(data['upperBody'])
          : null,
      lowerBody: data['lowerBody'] != null
          ? LowerBodyMeasurement.fromMap(data['lowerBody'])
          : null,
      footMeasurement: data['footMeasurement'] != null
          ? FootMeasurement.fromMap(data['footMeasurement'])
          : null,
      handMeasurement: data['handMeasurement'] != null
          ? HandMeasurement.fromMap(data['handMeasurement'])
          : null,
      headMeasurement: data['headMeasurement'] != null
          ? HeadMeasurement.fromMap(data['headMeasurement'])
          : null,
      faceMeasurement: data['faceMeasurement'] != null
          ? FaceMeasurement.fromMap(data['faceMeasurement'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'gender': gender,
        'fit': fit,
        'height': height?.toMap(),
        'upperBody': upperBody?.toMap(),
        'lowerBody': lowerBody?.toMap(),
        'footMeasurement': footMeasurement?.toMap(),
        'handMeasurement': handMeasurement?.toMap(),
        'headMeasurement': headMeasurement?.toMap(),
        'faceMeasurement': faceMeasurement?.toMap(),
      };
}
