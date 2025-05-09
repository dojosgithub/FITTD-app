import 'package:fitted/features/onboarding/data/models/female_measurement_model.dart';
import '../../../data/enums/male_measurement_enum.dart';

final maleUpperFields = [
  {
    'label': 'Bust',
    'enum': MaleMeasurementEnum.bicep,
    'getter': (FemaleMeasurementModel m) => m.bust,
  },
  {
    'label': 'Band size',
    'enum': MaleMeasurementEnum.chest,
    'getter': (FemaleMeasurementModel m) => m.bandSize,
  },
  {
    'label': 'Cup size',
    'enum': MaleMeasurementEnum.thighCircumference,
    'getter': (FemaleMeasurementModel m) => m.cupSize,
  },
  // {
  //   'label': 'Cup size',
  //   'enum': MaleMeasurementEnum.,
  //   'getter': (FemaleMeasurementModel m) => m.cupSize,
  // },
  {
    'label': 'Sleeves length',
    'enum': MaleMeasurementEnum.sleevesLength,
    'getter': (FemaleMeasurementModel m) => m.sleevesLength,
  },
  {
    'label': 'Waist',
    'enum': MaleMeasurementEnum.waist,
    'getter': (FemaleMeasurementModel m) => m.waist,
  },
  {
    'label': 'Minimum Torso height',
    'enum': MaleMeasurementEnum.torsoHeight,
    'getter': (FemaleMeasurementModel m) => m.torsoHeight,
  },
];

final maleLowerFields = [
  {
    'label': 'Lower Waist',
    'enum': MaleMeasurementEnum.lowerWaist,
    'getter': (FemaleMeasurementModel m) => m.lowerWaist,
  },
  {
    'label': 'Hip',
    'enum': MaleMeasurementEnum.hip,
    'getter': (FemaleMeasurementModel m) => m.hip,
  },
  {
    'label': 'Inseam',
    'enum': MaleMeasurementEnum.inseam,
    'getter': (FemaleMeasurementModel m) => m.inseam,
  },
  {
    'label': 'Leg length',
    'enum': MaleMeasurementEnum.legLength,
    'getter': (FemaleMeasurementModel m) => m.legLength,
  },
];
