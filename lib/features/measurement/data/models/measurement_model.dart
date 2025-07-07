
import 'package:equatable/equatable.dart';
import 'package:fitted/features/measurement/data/enums/unit_enum.dart';

class Measurement extends Equatable {
  final num value;
  final Unit unit;
  final String? description;

  const Measurement({
    required this.value,
    required this.unit,
    this.description,
  });

  Measurement convertTo(Unit targetUnit) {
    if (unit == targetUnit) return this;

    if (unit == Unit.cm && targetUnit == Unit.inch) {
      return Measurement(
          value: value / 2.54, unit: Unit.inch, description: description);
    } else if (unit == Unit.inch && targetUnit == Unit.cm) {
      return Measurement(
          value: value * 2.54, unit: Unit.cm, description: description);
    }
    return this;
  }

  factory Measurement.fromMap(Map<String, dynamic> map) {
    return Measurement(
      value: map['value'],
      unit: UnitExtension.fromString(map['unit']),
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap({bool sendOnlyDescription = false}) {
    if (sendOnlyDescription && description != null) {
      return {
        'value': description,
        'unit': unit.name,
      };
    }

    return {
      'value': value,
      'unit': unit.name,
      if (description != null) 'description': description,
    };
  }

  @override
  List<Object?> get props => [value, unit, description];
}
