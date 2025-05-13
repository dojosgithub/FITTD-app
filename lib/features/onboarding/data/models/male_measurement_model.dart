import 'package:equatable/equatable.dart';
import '../enums/male_measurement_enum.dart';
import 'measurement_model.dart';

class MaleMeasurementModel extends Equatable {
  final Measurement chest;
  final Measurement sleevesLength;
  final Measurement waist;
  final Measurement torsoHeight;
  final Measurement hip;
  final Measurement inseam;
  final Measurement legLength;
  final Measurement height;
  final Measurement bicep;
  final Measurement shoulderWidth;
  final Measurement lowerWaist;
  final Measurement thighCircumference;

  const MaleMeasurementModel({
    required this.chest,
    required this.sleevesLength,
    required this.waist,
    required this.torsoHeight,
    required this.hip,
    required this.inseam,
    required this.legLength,
    required this.height,
    required this.bicep,
    required this.shoulderWidth,
    required this.lowerWaist,
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
        legLength,
        height,
        bicep,
        shoulderWidth,
        lowerWaist,
        thighCircumference,
      ];

  MaleMeasurementModel copyWith({
    Measurement? chest,
    Measurement? sleevesLength,
    Measurement? waist,
    Measurement? torsoHeight,
    Measurement? hip,
    Measurement? inseam,
    Measurement? legLength,
    Measurement? height,
    Measurement? bicep,
    Measurement? shoulderWidth,
    Measurement? lowerWaist,
    Measurement? thighCircumference,
  }) {
    return MaleMeasurementModel(
      chest: chest ?? this.chest,
      sleevesLength: sleevesLength ?? this.sleevesLength,
      waist: waist ?? this.waist,
      torsoHeight: torsoHeight ?? this.torsoHeight,
      hip: hip ?? this.hip,
      inseam: inseam ?? this.inseam,
      legLength: legLength ?? this.legLength,
      height: height ?? this.height,
      bicep: bicep ?? this.bicep,
      shoulderWidth: shoulderWidth ?? this.shoulderWidth,
      lowerWaist: lowerWaist ?? this.lowerWaist,
      thighCircumference: thighCircumference ?? this.thighCircumference,
    );
  }

  MaleMeasurementModel updateMeasurement(
      MaleMeasurementEnum field, Measurement newValue) {
    switch (field) {
      case MaleMeasurementEnum.chest:
        return copyWith(chest: newValue);
      case MaleMeasurementEnum.sleevesLength:
        return copyWith(sleevesLength: newValue);
      case MaleMeasurementEnum.waist:
        return copyWith(waist: newValue);
      case MaleMeasurementEnum.torsoHeight:
        return copyWith(torsoHeight: newValue);
      case MaleMeasurementEnum.hip:
        return copyWith(hip: newValue);
      case MaleMeasurementEnum.inseam:
        return copyWith(inseam: newValue);
      case MaleMeasurementEnum.legLength:
        return copyWith(legLength: newValue);
      case MaleMeasurementEnum.height:
        return copyWith(height: newValue);
      case MaleMeasurementEnum.bicep:
        return copyWith(bicep: newValue);
      case MaleMeasurementEnum.lowerWaist:
        return copyWith(lowerWaist: newValue);
      case MaleMeasurementEnum.thighCircumference:
        return copyWith(thighCircumference: newValue);
      case MaleMeasurementEnum.shoulderWidth:
        return copyWith(shoulderWidth: newValue);
    }
  }
}
