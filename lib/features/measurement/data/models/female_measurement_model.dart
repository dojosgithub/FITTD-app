import 'package:equatable/equatable.dart';
import '../enums/female_measurement_enum.dart';
import 'measurement_model.dart';

class FemaleMeasurementModel extends Equatable {
  final Measurement bust;
  final Measurement bandSize;
  final Measurement cupSize;
  final Measurement sleevesLength;
  final Measurement waist;
  final Measurement torsoHeight;
  final Measurement lowerWaist;
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
    required this.lowerWaist,
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
        lowerWaist,
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
    Measurement? lowerWaist,
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
      lowerWaist: lowerWaist ?? this.lowerWaist,
      hip: hip ?? this.hip,
      inseam: inseam ?? this.inseam,
      legLength: legLength ?? this.legLength,
      height: height ?? this.height,
    );
  }

  FemaleMeasurementModel updateMeasurement(
      FemaleMeasurementEnum field, Measurement newValue) {
    switch (field) {
      case FemaleMeasurementEnum.bust:
        return copyWith(bust: newValue);
      case FemaleMeasurementEnum.bandSize:
        return copyWith(bandSize: newValue);
      case FemaleMeasurementEnum.cupSize:
        return copyWith(cupSize: newValue);
      case FemaleMeasurementEnum.sleevesLength:
        return copyWith(sleevesLength: newValue);
      case FemaleMeasurementEnum.waist:
        return copyWith(waist: newValue);
      case FemaleMeasurementEnum.torsoHeight:
        return copyWith(torsoHeight: newValue);
      case FemaleMeasurementEnum.hip:
        return copyWith(hip: newValue);
      case FemaleMeasurementEnum.inseam:
        return copyWith(inseam: newValue);
      case FemaleMeasurementEnum.legLength:
        return copyWith(legLength: newValue);
      case FemaleMeasurementEnum.height:
        return copyWith(height: newValue);
    }
  }
}
