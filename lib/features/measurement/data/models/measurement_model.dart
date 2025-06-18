import 'package:equatable/equatable.dart';
import 'package:fitted/features/measurement/data/enums/unit_enum.dart';

class Measurement extends Equatable {
  final num value;
  final Unit unit;

  const Measurement({required this.value, required this.unit});

  Measurement convertTo(Unit targetUnit) {
    if (unit == targetUnit) return this;

    if (unit == Unit.cm && targetUnit == Unit.inch) {
      return Measurement(value: value / 2.54, unit: Unit.inch);
    } else if (unit == Unit.inch && targetUnit == Unit.cm) {
      return Measurement(value: value * 2.54, unit: Unit.cm);
    }
    return this; // fallback
  }

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

  @override
  List<Object?> get props => [value, unit];
}
