import 'package:fitted/features/measurement/data/models/measurement_model.dart';
import 'package:fitted/features/measurement/data/models/measurement_request_model.dart';

import '../../domain/entities/measurement_entity.dart';
import '../enums/unit_enum.dart';

class MeasurementResponseModel {
  final MeasurementEntity data;
  final String? message;

  MeasurementResponseModel({required this.data, required this.message});

  factory MeasurementResponseModel.fromJson(Map<String, dynamic> json) {
    return MeasurementResponseModel(
      data: MeasurementEntityMapper.fromJson(json['data']),
      message: json['message'] ?? '',
    );
  }
}

class MeasurementEntityMapper {
  static MeasurementEntity fromJson(Map<String, dynamic> json) {
    return MeasurementEntity(
      gender: json['gender'],
      fit: json['fit'],
      height: Measurement(
        value: (json['height']['value'] as num).toDouble(),
        unit: UnitExtension.fromString(json['height']['unit']),
      ),
      upperBody: UpperBodyMeasurement.fromMap(json['upperBody']),
      lowerBody: LowerBodyMeasurement.fromMap(json['lowerBody']),
      footMeasurement: json['footMeasurement'] == null
          ? null
          : FootMeasurement.fromMap(json['footMeasurement']),
      handMeasurement: json['handMeasurement'] == null
          ? null
          : HandMeasurement.fromMap(json['handMeasurement']),
      headMeasurement: json['headMeasurement'] == null
          ? null
          : HeadMeasurement.fromMap(json['headMeasurement']),
      faceMeasurement: json['faceMeasurement'] == null
          ? null
          : FaceMeasurement.fromMap(json['faceMeasurement']),
    );
  }
}
