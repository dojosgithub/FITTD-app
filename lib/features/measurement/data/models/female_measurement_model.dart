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
      height: convert(height),
    );
  }

  String _calculateCupSize(double diffInInches) {
    if (diffInInches <= 1.0) return "AA";
    if (diffInInches <= 1.5) return "A";
    if (diffInInches <= 2.5) return "B";
    if (diffInInches <= 3.5) return "C";
    if (diffInInches <= 4.5) return "D";
    if (diffInInches <= 5.5) return "DD / E";
    if (diffInInches <= 6.5) return "F / DDD";
    if (diffInInches <= 7.5) return "FF / G";
    return "G / H";
  }

  FemaleMeasurementModel updateMeasurement(
      FemaleMeasurementEnum field, Measurement newValue) {
    // Pick model's current unit (any field's unit)
    final currentUnit = bust.unit;

    // Convert all fields to the new unit if needed
    FemaleMeasurementModel updatedModel = this;
    if (currentUnit != newValue.unit) {
      updatedModel = convertAllFieldsToUnit(newValue.unit);
    }

    // Update the target field
    switch (field) {
      case FemaleMeasurementEnum.bust:
        updatedModel = updatedModel.copyWith(bust: newValue);
        break;
      case FemaleMeasurementEnum.bandSize:
        updatedModel = updatedModel.copyWith(bandSize: newValue);
        break;
      case FemaleMeasurementEnum.cupSize:
        updatedModel = updatedModel.copyWith(cupSize: newValue);
        break;
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
      case FemaleMeasurementEnum.height:
        return updatedModel.copyWith(height: newValue);
    }

    if (field == FemaleMeasurementEnum.bust ||
        field == FemaleMeasurementEnum.bandSize) {
      final bustInInches = updatedModel.bust.unit == Unit.cm
          ? updatedModel.bust.value / 2.54
          : updatedModel.bust.value.toDouble();

      final bandInInches = updatedModel.bandSize.unit == Unit.cm
          ? updatedModel.bandSize.value / 2.54
          : updatedModel.bandSize.value.toDouble();

      final cupSizeDifference = bustInInches - bandInInches;
      final calculatedCupSize = _calculateCupSize(cupSizeDifference);

      updatedModel = updatedModel.copyWith(
        cupSize: Measurement(
          value: (updatedModel.bust.value - updatedModel.bandSize.value),
          unit: updatedModel.bust.unit,
          description: calculatedCupSize,
        ),
      );
    }

    return updatedModel;
  }

  factory FemaleMeasurementModel.empty() {
    const defaultUnit = Unit.cm;
    final zero = Measurement(value: 0.0, unit: defaultUnit);

    return FemaleMeasurementModel(
      sleevesLength: zero,
      waist: zero,
      torsoHeight: zero,
      hip: zero,
      inseam: zero,
      height: zero,
      bust: zero,
      bandSize: zero,
      cupSize: zero,
    );
  }
}
