import 'package:fitted/features/measurement/data/enums/unit_enum.dart';

class Measurement {
  final num value;
  final Unit unit;

  Measurement({required this.value, required this.unit});

  factory Measurement.fromMap(Map<String, dynamic> map) {
    return Measurement(
      value: (map['value'] as num).toDouble(),
      unit: UnitExtension.fromString(map['unit']),
    );
  }

  Map<String, dynamic> toMap() => {
        'value': value,
        'unit': unit.name,
      };
}
