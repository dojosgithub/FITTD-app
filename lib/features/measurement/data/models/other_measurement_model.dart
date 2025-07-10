import 'package:equatable/equatable.dart';
import 'package:fitted/features/measurement/data/enums/unit_enum.dart';

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

  Measurement _convertMeasurement(Measurement m, Unit toUnit) {
    if (m.unit == toUnit) return m;
    return Measurement(value: m.value, unit: toUnit);
  }

  OtherMeasurementModel convertAllFieldsToUnit(Unit newUnit) {
    return OtherMeasurementModel(
      faceLength: _convertMeasurement(faceLength, newUnit),
      faceWidth: _convertMeasurement(faceWidth, newUnit),
      feetLength: _convertMeasurement(feetLength, newUnit),
      handLength: _convertMeasurement(handLength, newUnit),
      handWidth: _convertMeasurement(handWidth, newUnit),
      head: _convertMeasurement(head, newUnit),
      feetWidth: _convertMeasurement(feetWidth, newUnit),
    );
  }

  OtherMeasurementModel updateMeasurement(
      OtherMeasurementsEnum field, Measurement newValue) {
    final currentUnit = faceLength.unit;

    OtherMeasurementModel updatedModel = this;

    if (currentUnit != newValue.unit) {
      updatedModel = convertAllFieldsToUnit(newValue.unit);
    }
    switch (field) {
      case OtherMeasurementsEnum.faceLength:
        return updatedModel.copyWith(faceLength: newValue);
      case OtherMeasurementsEnum.faceWidth:
        return updatedModel.copyWith(faceWidth: newValue);
      case OtherMeasurementsEnum.feetLength:
        return updatedModel.copyWith(feetLength: newValue);
      case OtherMeasurementsEnum.feetWidth:
        return updatedModel.copyWith(feetWidth: newValue);
      case OtherMeasurementsEnum.handLength:
        return updatedModel.copyWith(handLength: newValue);
      case OtherMeasurementsEnum.handWidth:
        return updatedModel.copyWith(handWidth: newValue);
      case OtherMeasurementsEnum.head:
        return updatedModel.copyWith(head: newValue);
    }
  }

  factory OtherMeasurementModel.empty() {
    const defaultUnit = Unit.cm;
    final zero = Measurement(value: 0.0, unit: defaultUnit);

    return OtherMeasurementModel(
      faceLength: zero,
      faceWidth: zero,
      feetLength: zero,
      feetWidth: zero,
      handLength: zero,
      handWidth: zero,
      head: zero,
    );
  }
}
