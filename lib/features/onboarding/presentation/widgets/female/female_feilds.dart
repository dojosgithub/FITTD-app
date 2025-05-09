import 'package:fitted/features/onboarding/data/models/female_measurement_model.dart';

import '../../../data/enums/female_measurement_enum.dart';

final femaleUpperFields = [
  {
    'label': 'Bust',
    'enum': FemaleMeasurementEnum.bust,
    'getter': (FemaleMeasurementModel m) => m.bust,
  },
  {
    'label': 'Band size',
    'enum': FemaleMeasurementEnum.bandSize,
    'getter': (FemaleMeasurementModel m) => m.bandSize,
  },
  {
    'label': 'Cup size',
    'enum': FemaleMeasurementEnum.cupSize,
    'getter': (FemaleMeasurementModel m) => m.cupSize,
  },
  {
    'label': 'Sleeves length',
    'enum': FemaleMeasurementEnum.sleevesLength,
    'getter': (FemaleMeasurementModel m) => m.sleevesLength,
  },
  {
    'label': 'Waist',
    'enum': FemaleMeasurementEnum.waist,
    'getter': (FemaleMeasurementModel m) => m.waist,
  },
  {
    'label': 'Minimum Torso height',
    'enum': FemaleMeasurementEnum.torsoHeight,
    'getter': (FemaleMeasurementModel m) => m.torsoHeight,
  },
];

final femaleLowerFields = [
  {
    'label': 'Lower Waist',
    'enum': FemaleMeasurementEnum.lowerWaist,
    'getter': (FemaleMeasurementModel m) => m.lowerWaist,
  },
  {
    'label': 'Hip',
    'enum': FemaleMeasurementEnum.hip,
    'getter': (FemaleMeasurementModel m) => m.hip,
  },
  {
    'label': 'Inseam',
    'enum': FemaleMeasurementEnum.inseam,
    'getter': (FemaleMeasurementModel m) => m.inseam,
  },
  {
    'label': 'Leg length',
    'enum': FemaleMeasurementEnum.legLength,
    'getter': (FemaleMeasurementModel m) => m.legLength,
  },
];
