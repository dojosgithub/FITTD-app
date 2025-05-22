import 'package:equatable/equatable.dart';

import '../enums/other_measurements_enum.dart';
import 'measurement_model.dart';

class OtherMeasurementModel extends Equatable {
  final Measurement feetLength;
  final Measurement feetWidth;
  final Measurement handLength;
  final Measurement handWidth;
  final Measurement head;
  final Measurement faceLength;
  final Measurement faceWidth;

  const OtherMeasurementModel({
    required this.feetLength,
    required this.feetWidth,
    required this.handLength,
    required this.handWidth,
    required this.head,
    required this.faceLength,
    required this.faceWidth,
  });

  @override
  List<Object?> get props => [
        feetLength,
        feetWidth,
        handLength,
        handWidth,
        head,
        faceLength,
        faceWidth,
      ];

  OtherMeasurementModel copyWith({
    Measurement? feetLength,
    Measurement? feetWidth,
    Measurement? handLength,
    Measurement? handWidth,
    Measurement? head,
    Measurement? faceLength,
    Measurement? faceWidth,
  }) {
    return OtherMeasurementModel(
      head: head ?? this.head,
      faceLength: faceLength ?? this.faceLength,
      faceWidth: faceWidth ?? this.faceWidth,
      feetLength: feetLength ?? this.feetLength,
      feetWidth: feetWidth ?? this.feetWidth,
      handLength: handLength ?? this.handLength,
      handWidth: handWidth ?? this.handWidth,
    );
  }

  OtherMeasurementModel updateMeasurement(
      OtherMeasurementsEnum field, Measurement newValue) {
    switch (field) {
      case OtherMeasurementsEnum.faceLength:
        return copyWith(faceLength: newValue);
      case OtherMeasurementsEnum.faceWidth:
        return copyWith(faceWidth: newValue);
      case OtherMeasurementsEnum.feetLength:
        return copyWith(feetLength: newValue);
      case OtherMeasurementsEnum.feetWidth:
        return copyWith(feetWidth: newValue);
      case OtherMeasurementsEnum.handLength:
        return copyWith(handLength: newValue);
      case OtherMeasurementsEnum.handWidth:
        return copyWith(handWidth: newValue);
      case OtherMeasurementsEnum.head:
        return copyWith(head: newValue);
    }
  }
}
