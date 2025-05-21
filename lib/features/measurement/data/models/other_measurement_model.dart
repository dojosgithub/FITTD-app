import 'package:equatable/equatable.dart';
import 'package:fitted/features/measurement/data/enums/other_measurements_enum.dart';

import 'measurement_model.dart';

class OtherMeasurementModel extends Equatable {
  final Measurement feetLength;
  final Measurement feetWidth;
  final Measurement handLength;
  final Measurement handWidth;
  final Measurement head;
  final Measurement face;

  const OtherMeasurementModel({
    required this.feetLength,
    required this.feetWidth,
    required this.handLength,
    required this.handWidth,
    required this.head,
    required this.face,
  });

  @override
  List<Object?> get props => [
        feetLength,
        feetWidth,
        handLength,
        handWidth,
        head,
        face,
      ];

  OtherMeasurementModel copyWith({
    Measurement? feetLength,
    Measurement? feetWidth,
    Measurement? handLength,
    Measurement? handWidth,
    Measurement? head,
    Measurement? face,
  }) {
    return OtherMeasurementModel(
      head: head ?? this.head,
      face: face ?? this.face,
      feetLength: feetLength ?? this.feetLength,
      feetWidth: feetWidth ?? this.feetWidth,
      handLength: handLength ?? this.handLength,
      handWidth: handWidth ?? this.handWidth,
    );
  }

  OtherMeasurementModel updateMeasurement(
      OtherMeasurementsEnum field, Measurement newValue) {
    switch (field) {
      case OtherMeasurementsEnum.face:
        return copyWith(face: newValue);
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
