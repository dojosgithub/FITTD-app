import 'package:fitted/features/onboarding/bloc/bloc.dart';
import 'package:fitted/features/onboarding/data/enums/male_measurement_enum.dart';
import 'package:fitted/features/onboarding/data/models/male_measurement_model.dart';
import 'package:fitted/features/onboarding/data/models/measurement_model.dart';
import 'package:flutter/material.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../build_measurement_feild.dart';
import '../male_feilds.dart';

class MaleUpperForm extends StatelessWidget {
  const MaleUpperForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) => Column(
        children: [
          for (final field in maleUpperFields) ...[
            buildMeasurementField(
              context: context,
              state: state,
              label: field['label'] as String,
              fieldEnum: field['enum'] as MaleMeasurementEnum,
              value: (field['getter'] as Measurement Function(
                      MaleMeasurementModel))
                  .call(state.maleMeasurementModel)
                  .value,
              unit: (field['getter'] as Measurement Function(
                      MaleMeasurementModel))
                  .call(state.maleMeasurementModel)
                  .unit,
            ),
            SpacersVertical.spacer18,
          ],
          CustomButton(
            text: "Next",
            onTap: () {
              for (final field in maleUpperFields) {
                final label = field['label'] as String;
                final getter = field['getter'] as Measurement Function(
                    MaleMeasurementModel);
                final measurement = getter(state.maleMeasurementModel);
                print(
                    '$label: Value = ${measurement.value}, Unit = ${measurement.unit.name}');
              }
              context.read<OnboardingBloc>().add(IncrementIndex());
            },
          ),
          SpacersVertical.spacer28,
        ],
      ),
    );
  }
}
