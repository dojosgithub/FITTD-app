import 'measurement_model.dart';

class MeasurementRequestModel {
  final String? gender;
  final String? fit;
  final Measurement? height;
  final UpperBodyMeasurement? upperBody;
  final LowerBodyMeasurement? lowerBody;
  final FootMeasurement? footMeasurement;
  final HandMeasurement? handMeasurement;
  final HeadMeasurement? headMeasurement;
  final FaceMeasurement? faceMeasurement;

  MeasurementRequestModel({
    this.gender,
    this.fit,
    this.height,
    this.upperBody,
    this.lowerBody,
    this.footMeasurement,
    this.handMeasurement,
    this.headMeasurement,
    this.faceMeasurement,
  });

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "fit": fit,
        "height": height?.toMap(),
        "upperBody": upperBody?.toMap(),
        "lowerBody": lowerBody?.toMap(),
        if (footMeasurement != null)
          "footMeasurement": footMeasurement!.toMap(),
        if (handMeasurement != null)
          "handMeasurement": handMeasurement!.toMap(),
        if (headMeasurement != null)
          "headMeasurement": headMeasurement!.toMap(),
        if (faceMeasurement != null)
          "faceMeasurement": faceMeasurement!.toMap(),
      };
}

class UpperBodyMeasurement {
  final Measurement? chest;
  final Measurement? shoulderWidth;
  final Measurement? bicep;
  final Measurement? bust;
  final Measurement? bandSize;
  final Measurement? cupSize;
  final Measurement? sleevesLength;
  final Measurement? torsoHeight;

  UpperBodyMeasurement({
    this.chest,
    this.shoulderWidth,
    this.bicep,
    this.bust,
    this.bandSize,
    this.cupSize,
    this.sleevesLength,
    this.torsoHeight,
  });

  factory UpperBodyMeasurement.fromMap(Map<String, dynamic> map) {
    return UpperBodyMeasurement(
      chest: map['chest'] != null ? Measurement.fromMap(map['chest']) : null,
      shoulderWidth: map['shoulderWidth'] != null
          ? Measurement.fromMap(map['shoulderWidth'])
          : null,
      bicep: map['bicep'] != null ? Measurement.fromMap(map['bicep']) : null,
      bust: map['bust'] != null ? Measurement.fromMap(map['bust']) : null,
      bandSize:
          map['bandSize'] != null ? Measurement.fromMap(map['bandSize']) : null,
      cupSize:
          map['cupSize'] != null ? Measurement.fromMap(map['cupSize']) : null,
      sleevesLength: map['sleevesLength'] != null
          ? Measurement.fromMap(map['sleevesLength'])
          : null,
      torsoHeight: map['torsoHeight'] != null
          ? Measurement.fromMap(map['torsoHeight'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'chest': chest?.toMap(),
        'shoulderWidth': shoulderWidth?.toMap(),
        'bicep': bicep?.toMap(),
        'bust': bust?.toMap(),
        'bandSize': bandSize?.toMap(),
        'cupSize': cupSize?.toMap(),
        'sleevesLength': sleevesLength?.toMap(),
        'torsoHeight': torsoHeight?.toMap(),
      };
}

class LowerBodyMeasurement {
  final Measurement? waist;
  final Measurement? hip;
  final Measurement? inseam;

  final Measurement? thighCircumference;

  LowerBodyMeasurement({
    this.waist,
    this.hip,
    this.inseam,
    this.thighCircumference,
  });

  factory LowerBodyMeasurement.fromMap(Map<String, dynamic> map) {
    return LowerBodyMeasurement(
      waist: map['waist'] != null ? Measurement.fromMap(map['waist']) : null,
      hip: map['hip'] != null ? Measurement.fromMap(map['hip']) : null,
      inseam: map['inseam'] != null ? Measurement.fromMap(map['inseam']) : null,
      thighCircumference: map['thighCircumference'] != null
          ? Measurement.fromMap(map['thighCircumference'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'waist': waist?.toMap(),
        'hip': hip?.toMap(),
        'inseam': inseam?.toMap(),
        'thighCircumference': thighCircumference?.toMap(),
      };
}

class FootMeasurement {
  final Measurement? footLength;
  final Measurement? footWidth;

  FootMeasurement({
    this.footLength,
    this.footWidth,
  });

  factory FootMeasurement.fromMap(Map<String, dynamic> map) {
    return FootMeasurement(
      footLength: map['footLength'] != null
          ? Measurement.fromMap(map['footLength'])
          : null,
      footWidth: map['footWidth'] != null
          ? Measurement.fromMap(map['footWidth'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'footLength': footLength?.toMap(),
        'footWidth': footWidth?.toMap(),
      };
}

class HandMeasurement {
  final Measurement? handLength;
  final Measurement? handWidth;

  HandMeasurement({
    this.handLength,
    this.handWidth,
  });

  factory HandMeasurement.fromMap(Map<String, dynamic> map) {
    return HandMeasurement(
      handLength: map['palmWidth'] != null
          ? Measurement.fromMap(map['palmWidth'])
          : null,
      handWidth: map['fingerLength'] != null
          ? Measurement.fromMap(map['fingerLength'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'palmWidth': handLength?.toMap(),
        'fingerLength': handWidth?.toMap(),
      };
}

class HeadMeasurement {
  final Measurement? headCircumference;

  HeadMeasurement({
    this.headCircumference,
  });

  factory HeadMeasurement.fromMap(Map<String, dynamic> map) {
    return HeadMeasurement(
      headCircumference: map['headCircumference'] != null
          ? Measurement.fromMap(map['headCircumference'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'headCircumference': headCircumference?.toMap(),
      };
}

class FaceMeasurement {
  final Measurement? faceWidth;
  final Measurement? faceLength;

  FaceMeasurement({
    this.faceWidth,
    this.faceLength,
  });

  factory FaceMeasurement.fromMap(Map<String, dynamic> map) {
    return FaceMeasurement(
      faceWidth: map['faceWidth'] != null
          ? Measurement.fromMap(map['faceWidth'])
          : null,
      faceLength: map['faceLength'] != null
          ? Measurement.fromMap(map['faceLength'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'faceWidth': faceWidth?.toMap(),
        'faceLength': faceLength?.toMap(),
      };
}
