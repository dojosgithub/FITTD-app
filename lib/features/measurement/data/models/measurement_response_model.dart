import 'package:fitted/features/measurement/data/models/measurement_model.dart';
import 'package:fitted/features/measurement/data/models/measurement_request_model.dart';

import '../../domain/entities/measurement_entity.dart';

class MeasurementResponseModel {
  final MeasurementEntity data;
  final String message;

  MeasurementResponseModel({required this.data, required this.message});

  factory MeasurementResponseModel.fromJson(Map<String, dynamic> json) {
    return MeasurementResponseModel(
      data: MeasurementEntityMapper.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class MeasurementEntityMapper {
  static MeasurementEntity fromJson(Map<String, dynamic> json) {
    return MeasurementEntity(
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
