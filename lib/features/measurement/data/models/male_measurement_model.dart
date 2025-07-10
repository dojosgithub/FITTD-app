import 'package:equatable/equatable.dart';
import '../enums/male_measurement_enum.dart';
import 'measurement_model.dart';
import '../enums/unit_enum.dart';

class MaleMeasurementModel extends Equatable {
  final Measurement chest;
  final Measurement sleevesLength;
  final Measurement waist;
  final Measurement torsoHeight;
  final Measurement hip;
  final Measurement inseam;
  final Measurement height;
  final Measurement bicep;
  final Measurement shoulderWidth;
  final Measurement thighCircumference;

  const MaleMeasurementModel({
    required this.chest,
    required this.sleevesLength,
    required this.waist,
    required this.torsoHeight,
    required this.hip,
    required this.inseam,
    required this.height,
    required this.bicep,
    required this.shoulderWidth,
    required this.thighCircumference,
  });

  @override
  List<Object?> get props => [
        chest,
        sleevesLength,
        waist,
        torsoHeight,
        hip,
        inseam,
        height,
        bicep,
        shoulderWidth,
        thighCircumference,
      ];

  MaleMeasurementModel copyWith({
    Measurement? chest,
    Measurement? sleevesLength,
    Measurement? waist,
    Measurement? torsoHeight,
    Measurement? hip,
    Measurement? inseam,
    Measurement? height,
    Measurement? bicep,
    Measurement? shoulderWidth,
    Measurement? thighCircumference,
  }) {
    return MaleMeasurementModel(
      chest: chest ?? this.chest,
      sleevesLength: sleevesLength ?? this.sleevesLength,
      waist: waist ?? this.waist,
      torsoHeight: torsoHeight ?? this.torsoHeight,
      hip: hip ?? this.hip,
      inseam: inseam ?? this.inseam,
      height: height ?? this.height,
      bicep: bicep ?? this.bicep,
      shoulderWidth: shoulderWidth ?? this.shoulderWidth,
      thighCircumference: thighCircumference ?? this.thighCircumference,
    );
  }

  Measurement _convertMeasurement(Measurement m, Unit toUnit) {
    if (m.unit == toUnit) return m;
    return Measurement(value: m.value, unit: toUnit);
  }

  MaleMeasurementModel convertAllFieldsToUnit(Unit newUnit) {
    return MaleMeasurementModel(
      chest: _convertMeasurement(chest, newUnit),
      sleevesLength: _convertMeasurement(sleevesLength, newUnit),
      waist: _convertMeasurement(waist, newUnit),
      torsoHeight: _convertMeasurement(torsoHeight, newUnit),
      hip: _convertMeasurement(hip, newUnit),
      inseam: _convertMeasurement(inseam, newUnit),
      height: _convertMeasurement(height, newUnit),
      bicep: _convertMeasurement(bicep, newUnit),
      shoulderWidth: _convertMeasurement(shoulderWidth, newUnit),
      thighCircumference: _convertMeasurement(thighCircumference, newUnit),
    );
  }

  MaleMeasurementModel updateMeasurement(
      MaleMeasurementEnum field, Measurement newValue) {
    final currentUnit = chest.unit;

    MaleMeasurementModel updatedModel = this;

    if (currentUnit != newValue.unit) {
      updatedModel = convertAllFieldsToUnit(newValue.unit);
    }

    switch (field) {
      case MaleMeasurementEnum.chest:
        return updatedModel.copyWith(chest: newValue);
      case MaleMeasurementEnum.sleevesLength:
        return updatedModel.copyWith(sleevesLength: newValue);
      case MaleMeasurementEnum.waist:
        return updatedModel.copyWith(waist: newValue);
      case MaleMeasurementEnum.torsoHeight:
        return updatedModel.copyWith(torsoHeight: newValue);
      case MaleMeasurementEnum.hip:
        return updatedModel.copyWith(hip: newValue);
      case MaleMeasurementEnum.inseam:
        return updatedModel.copyWith(inseam: newValue);
      case MaleMeasurementEnum.height:
        return updatedModel.copyWith(height: newValue);
      case MaleMeasurementEnum.bicep:
        return updatedModel.copyWith(bicep: newValue);
      case MaleMeasurementEnum.thighCircumference:
        return updatedModel.copyWith(thighCircumference: newValue);
      case MaleMeasurementEnum.shoulderWidth:
        return updatedModel.copyWith(shoulderWidth: newValue);
    }
  }

  factory MaleMeasurementModel.empty() {
    const defaultUnit = Unit.cm;
    final zero = Measurement(value: 0.0, unit: defaultUnit);

    return MaleMeasurementModel(
      chest: zero,
      sleevesLength: zero,
      waist: zero,
      torsoHeight: zero,
      hip: zero,
      inseam: zero,
      height: zero,
      bicep: zero,
      shoulderWidth: zero,
      thighCircumference: zero,
    );
  }
}
