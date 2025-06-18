import 'package:equatable/equatable.dart';
import 'package:fitted/features/measurement/data/enums/unit_enum.dart';
import '../enums/female_measurement_enum.dart';
import 'measurement_model.dart';

class FemaleMeasurementModel extends Equatable {
  final Measurement bust;
  final Measurement bandSize;
  final Measurement cupSize;
  final Measurement sleevesLength;
  final Measurement waist;
  final Measurement torsoHeight;
  final Measurement hip;
  final Measurement inseam;
  final Measurement legLength;
  final Measurement height;

  const FemaleMeasurementModel({
    required this.bust,
    required this.bandSize,
    required this.cupSize,
    required this.sleevesLength,
    required this.waist,
    required this.torsoHeight,
    required this.hip,
    required this.inseam,
    required this.legLength,
    required this.height,
  });

  @override
  List<Object?> get props => [
        bust,
        bandSize,
        cupSize,
        sleevesLength,
        waist,
        torsoHeight,
        hip,
        inseam,
        legLength,
        height,
      ];

  FemaleMeasurementModel copyWith({
    Measurement? bust,
    Measurement? bandSize,
    Measurement? cupSize,
    Measurement? sleevesLength,
    Measurement? waist,
    Measurement? torsoHeight,
    Measurement? hip,
    Measurement? inseam,
    Measurement? legLength,
    Measurement? height,
  }) {
    return FemaleMeasurementModel(
      bust: bust ?? this.bust,
      bandSize: bandSize ?? this.bandSize,
      cupSize: cupSize ?? this.cupSize,
      sleevesLength: sleevesLength ?? this.sleevesLength,
      waist: waist ?? this.waist,
      torsoHeight: torsoHeight ?? this.torsoHeight,
      hip: hip ?? this.hip,
      inseam: inseam ?? this.inseam,
      legLength: legLength ?? this.legLength,
      height: height ?? this.height,
    );
  }

  FemaleMeasurementModel convertAllFieldsToUnit(Unit newUnit) {
    Measurement convert(Measurement m) {
      if (m.unit == newUnit) return m;

      return Measurement(value: m.value, unit: newUnit);
    }

    return FemaleMeasurementModel(
      bust: convert(bust),
      bandSize: convert(bandSize),
      cupSize: convert(cupSize),
      sleevesLength: convert(sleevesLength),
      waist: convert(waist),
      torsoHeight: convert(torsoHeight),
      hip: convert(hip),
      inseam: convert(inseam),
      legLength: convert(legLength),
      height: convert(height),
    );
  }

  FemaleMeasurementModel updateMeasurement(
      FemaleMeasurementEnum field, Measurement newValue) {
    // Pick model's current unit (any field's unit)
    final currentUnit = bust.unit;

    // If units differ, convert all fields to newValue.unit first
    FemaleMeasurementModel updatedModel = this;
    if (currentUnit != newValue.unit) {
      updatedModel = convertAllFieldsToUnit(newValue.unit);
    }

    // Now update the specific field with newValue (already in newValue.unit)
    switch (field) {
      case FemaleMeasurementEnum.bust:
        return updatedModel.copyWith(bust: newValue);
      case FemaleMeasurementEnum.bandSize:
        return updatedModel.copyWith(bandSize: newValue);
      case FemaleMeasurementEnum.cupSize:
        return updatedModel.copyWith(cupSize: newValue);
      case FemaleMeasurementEnum.sleevesLength:
        return updatedModel.copyWith(sleevesLength: newValue);
      case FemaleMeasurementEnum.waist:
        return updatedModel.copyWith(waist: newValue);
      case FemaleMeasurementEnum.torsoHeight:
        return updatedModel.copyWith(torsoHeight: newValue);
      case FemaleMeasurementEnum.hip:
        return updatedModel.copyWith(hip: newValue);
      case FemaleMeasurementEnum.inseam:
        return updatedModel.copyWith(inseam: newValue);
      case FemaleMeasurementEnum.legLength:
        return updatedModel.copyWith(legLength: newValue);
      case FemaleMeasurementEnum.height:
        return updatedModel.copyWith(height: newValue);
    }
  }
}
