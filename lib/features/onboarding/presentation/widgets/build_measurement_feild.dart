import 'package:fitted/config/helper/form_validation/form_validator.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/features/onboarding/data/enums/female_measurement_enum.dart';
import 'package:fitted/features/onboarding/data/models/measurement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/widgets/input_feild.dart';
import '../../bloc/bloc.dart';
import '../../data/enums/unit_enum.dart';
import '../../data/models/female_measurement_model.dart';
import 'unit_dropdown.dart';

Widget buildMeasurementField({
  required BuildContext context,
  required OnboardingState state,
  required String label,
  required FemaleMeasurementEnum fieldEnum,
  required num value,
  required Unit unit,
}) {
  return FittedInputField.withIcon(
    validator: InputValidators.notEmpty(),
    spacing: SpacersVertical.spacer8,
    label: label,
    hint: "eg. 150",
    keyboardType: TextInputType.number,
    onChanged: (p0) {
      if (p0.isNotEmpty) {
        context.read<OnboardingBloc>().add(UpdateMeasurement(
              field: fieldEnum,
              value: Measurement(value: num.parse(p0), unit: unit),
            ));
      }
    },
    suffixIcon: UnitDropdown(
      selectedUnit: unit,
      feild: fieldEnum,
      value: value,
    ),
  );
}
