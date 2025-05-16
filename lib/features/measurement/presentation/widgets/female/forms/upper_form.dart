import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/data/models/measurement_model.dart';
import 'package:fitted/features/measurement/presentation/widgets/build_measurement_feild.dart';
import 'package:fitted/features/measurement/presentation/widgets/female/female_feilds.dart';
import 'package:flutter/material.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/enums/female_measurement_enum.dart';
import '../../../../data/models/female_measurement_model.dart';

class FemaleUpperForm extends StatelessWidget {
  const FemaleUpperForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurementBloc, MeasurementState>(
      builder: (context, state) => Column(
        children: [
          for (final field in femaleUpperFields) ...[
            buildMeasurementField(
              context: context,
              state: state,
              label: field['label'] as String,
              fieldEnum: field['enum'] as FemaleMeasurementEnum,
              value: (field['getter'] as Measurement Function(
                      FemaleMeasurementModel))
                  .call(state.femaleMeasurementModel)
                  .value,
              unit: (field['getter'] as Measurement Function(
                      FemaleMeasurementModel))
                  .call(state.femaleMeasurementModel)
                  .unit,
            ),
            SpacersVertical.spacer18,
          ],
          CustomButton(
            text: "Next",
            onTap: () {
              context.read<MeasurementBloc>().add(IncrementIndex());
            },
          ),
          SpacersVertical.spacer28,
        ],
      ),
    );
  }
}
