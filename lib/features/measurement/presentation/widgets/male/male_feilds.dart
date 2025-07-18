import 'package:fitted/features/measurement/data/models/male_measurement_model.dart';
import '../../../data/enums/male_measurement_enum.dart';

final maleUpperFields = [
  {
    'label': 'Chest',
    'enum': MaleMeasurementEnum.chest,
    'getter': (MaleMeasurementModel m) => m.chest,
  },
  {
    'label': 'Shoulder Width',
    'enum': MaleMeasurementEnum.shoulderWidth,
    'getter': (MaleMeasurementModel m) => m.shoulderWidth,
  },
  {
    'label': 'Bicep',
    'enum': MaleMeasurementEnum.bicep,
    'getter': (MaleMeasurementModel m) => m.bicep,
  },
  {
    'label': 'Sleeves length',
    'enum': MaleMeasurementEnum.sleevesLength,
    'getter': (MaleMeasurementModel m) => m.sleevesLength,
  },
  {
    'label': 'Minimum Torso height',
    'enum': MaleMeasurementEnum.torsoHeight,
    'getter': (MaleMeasurementModel m) => m.torsoHeight,
  },
];

final maleLowerFields = [
  {
    'label': 'Waist',
    'enum': MaleMeasurementEnum.waist,
    'getter': (MaleMeasurementModel m) => m.waist,
  },
  {
    'label': 'Hip',
    'enum': MaleMeasurementEnum.hip,
    'getter': (MaleMeasurementModel m) => m.hip,
  },
  {
    'label': 'Inseam',
    'enum': MaleMeasurementEnum.inseam,
    'getter': (MaleMeasurementModel m) => m.inseam,
  },
  {
    'label': 'Thigh Circumference',
    'enum': MaleMeasurementEnum.thighCircumference,
    'getter': (MaleMeasurementModel m) => m.thighCircumference,
  },
];
