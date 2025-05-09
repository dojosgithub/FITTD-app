enum Unit { cm, inch }

extension UnitExtension on Unit {
  String get display => switch (this) {
        Unit.cm => 'cm',
        Unit.inch => 'in',
      };

  static Unit fromString(String value) {
    return Unit.values.firstWhere((e) => e.name == value);
  }
}
