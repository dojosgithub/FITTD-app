import 'measurement_model.dart';

class MeasurementRequestModel {
  final String gender;
  final String fit;
  final Measurement height;
  final UpperBodyMeasurement upperBody;
  final LowerBodyMeasurement lowerBody;
  final FootMeasurement? footMeasurement;
  final HandMeasurement? handMeasurement;
  final HeadMeasurement? headMeasurement;
  final FaceMeasurement? faceMeasurement;

  MeasurementRequestModel({
    required this.gender,
    required this.fit,
    required this.height,
    required this.upperBody,
    required this.lowerBody,
    this.footMeasurement,
    this.handMeasurement,
    this.headMeasurement,
    this.faceMeasurement,
  });

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "fit": fit,
        "height": height.toMap(),
        "upperBody": upperBody.toMap(),
        "lowerBody": lowerBody.toMap(),
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
  final Measurement? legLength;
  final Measurement? thighCircumference;

  LowerBodyMeasurement({
    this.waist,
    this.hip,
    this.inseam,
    this.legLength,
    this.thighCircumference,
  });

  factory LowerBodyMeasurement.fromMap(Map<String, dynamic> map) {
    return LowerBodyMeasurement(
      waist: map['waist'] != null ? Measurement.fromMap(map['waist']) : null,
      hip: map['hip'] != null ? Measurement.fromMap(map['hip']) : null,
      inseam: map['inseam'] != null ? Measurement.fromMap(map['inseam']) : null,
      legLength: map['legLength'] != null
          ? Measurement.fromMap(map['legLength'])
          : null,
      thighCircumference: map['thighCircumference'] != null
          ? Measurement.fromMap(map['thighCircumference'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'waist': waist?.toMap(),
        'hip': hip?.toMap(),
        'inseam': inseam?.toMap(),
        'legLength': legLength?.toMap(),
        'thighCircumference': thighCircumference?.toMap(),
      };
}

class FootMeasurement {
  final Measurement? footLength;
  final Measurement? footWidth;
  final Measurement? ankleCircumference;

  FootMeasurement({
    this.footLength,
    this.footWidth,
    this.ankleCircumference,
  });

  factory FootMeasurement.fromMap(Map<String, dynamic> map) {
    return FootMeasurement(
      footLength: map['footLength'] != null
          ? Measurement.fromMap(map['footLength'])
          : null,
      footWidth: map['footWidth'] != null
          ? Measurement.fromMap(map['footWidth'])
          : null,
      ankleCircumference: map['ankleCircumference'] != null
          ? Measurement.fromMap(map['ankleCircumference'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'footLength': footLength?.toMap(),
        'footWidth': footWidth?.toMap(),
        'ankleCircumference': ankleCircumference?.toMap(),
      };
}

class HandMeasurement {
  final Measurement? palmWidth;
  final Measurement? fingerLength;

  HandMeasurement({
    this.palmWidth,
    this.fingerLength,
  });

  factory HandMeasurement.fromMap(Map<String, dynamic> map) {
    return HandMeasurement(
      palmWidth: map['palmWidth'] != null
          ? Measurement.fromMap(map['palmWidth'])
          : null,
      fingerLength: map['fingerLength'] != null
          ? Measurement.fromMap(map['fingerLength'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'palmWidth': palmWidth?.toMap(),
        'fingerLength': fingerLength?.toMap(),
      };
}

class HeadMeasurement {
  final Measurement? headCircumference;
  final Measurement? faceWidth;
  final Measurement? faceLength;

  HeadMeasurement({
    this.headCircumference,
    this.faceWidth,
    this.faceLength,
  });

  factory HeadMeasurement.fromMap(Map<String, dynamic> map) {
    return HeadMeasurement(
      headCircumference: map['headCircumference'] != null
          ? Measurement.fromMap(map['headCircumference'])
          : null,
      faceWidth: map['faceWidth'] != null
          ? Measurement.fromMap(map['faceWidth'])
          : null,
      faceLength: map['faceLength'] != null
          ? Measurement.fromMap(map['faceLength'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'headCircumference': headCircumference?.toMap(),
        'faceWidth': faceWidth?.toMap(),
        'faceLength': faceLength?.toMap(),
      };
}

class FaceMeasurement {
  final Measurement? cheekboneWidth;
  final Measurement? jawWidth;
  final Measurement? noseWidth;

  FaceMeasurement({
    this.cheekboneWidth,
    this.jawWidth,
    this.noseWidth,
  });

  factory FaceMeasurement.fromMap(Map<String, dynamic> map) {
    return FaceMeasurement(
      cheekboneWidth: map['cheekboneWidth'] != null
          ? Measurement.fromMap(map['cheekboneWidth'])
          : null,
      jawWidth:
          map['jawWidth'] != null ? Measurement.fromMap(map['jawWidth']) : null,
      noseWidth: map['noseWidth'] != null
          ? Measurement.fromMap(map['noseWidth'])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        'cheekboneWidth': cheekboneWidth?.toMap(),
        'jawWidth': jawWidth?.toMap(),
        'noseWidth': noseWidth?.toMap(),
      };
}
