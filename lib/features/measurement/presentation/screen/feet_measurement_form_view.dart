import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/measurement/data/enums/other_measurements_enum.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/helper/form_validation/form_validator.dart';
import '../../../../config/helper/spacers/spacers.dart';
import '../../../../config/widgets/app_text.dart';
import '../../../../config/widgets/input_feild.dart';
import '../../data/models/measurement_model.dart';
import '../widgets/measurement_appbar.dart';
import '../widgets/unit_dropdown.dart';

class FeetMeasurementFormView extends StatelessWidget {
  const FeetMeasurementFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeasurementAppbarWidget(
        appbarTitle: "Feet Measurement",
      ),
      body: BlocConsumer<MeasurementBloc, MeasurementState>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.pushReplacementNamed(
              AppRoutesEnum.main.name,
              extra: {"index": 2},
            );
          }
        },
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpacersVertical.spacer34,
              AppText.poppinsBold(
                "Add Foot Measurement ",
                fontSize: 20,
                height: 28 / 20,
                color: AppColors.black,
              ),
              SpacersVertical.spacer8,
              AppText.poppinsRegular(
                "Answer these questions, & we'll suggest ideal footwear tailored to your size.",
                fontSize: 14,
                height: 22 / 14,
                color: AppColors.black.withValues(alpha: 0.6),
                letterSpacing: 0.02 * 14,
                textAlign: TextAlign.center,
              ),
              SpacersVertical.spacer26,
              FittedInputField.withIcon(
                initialValue:
                    state.otherMeasurementModel.feetWidth.value.toString(),
                validator: InputValidators.notEmpty(),
                spacing: SpacersVertical.spacer8,
                label: "Foot Length",
                hint: "eg. 150",
                keyboardType: TextInputType.number,
                onChanged: (p0) {
                  if (p0.isNotEmpty) {
                    context.read<MeasurementBloc>().add(UpdateOtherMeasurement(
                          field: OtherMeasurementsEnum.feetLength,
                          value: Measurement(
                              value: num.parse(p0),
                              unit:
                                  state.otherMeasurementModel.feetLength.unit),
                        ));
                  }
                },
                suffixIcon: UnitDropdown(
                  selectedUnit: state.otherMeasurementModel.feetLength.unit,
                  field: OtherMeasurementsEnum.feetLength,
                  value: state.otherMeasurementModel.feetLength.value,
                ),
              ),
              SpacersVertical.spacer32,
              FittedInputField.withIcon(
                initialValue:
                    state.otherMeasurementModel.feetLength.value.toString(),
                validator: InputValidators.notEmpty(),
                spacing: SpacersVertical.spacer8,
                label: "Foot Width",
                hint: "eg. 150",
                keyboardType: TextInputType.number,
                onChanged: (p0) {
                  if (p0.isNotEmpty) {
                    context.read<MeasurementBloc>().add(UpdateOtherMeasurement(
                          field: OtherMeasurementsEnum.feetWidth,
                          value: Measurement(
                              value: num.parse(p0),
                              unit: state.otherMeasurementModel.feetWidth.unit),
                        ));
                  }
                },
                suffixIcon: UnitDropdown(
                  selectedUnit: state.otherMeasurementModel.feetWidth.unit,
                  field: OtherMeasurementsEnum.feetWidth,
                  value: state.otherMeasurementModel.feetWidth.value,
                ),
              ),
              Spacer(),
              state.isLoading
                  ? LoadingIndicator()
                  : CustomButton(
                      onTap: () => context
                          .read<MeasurementBloc>()
                          .add(AddMeasurements()),
                      text: "Save",
                      width: 336,
                      height: 52,
                    ),
              SpacersVertical.spacer34,
            ],
          ),
        ),
      ),
    );
  }
}
