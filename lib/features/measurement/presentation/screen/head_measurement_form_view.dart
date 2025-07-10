import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';

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

class HeadMeasurementFormView extends StatelessWidget {
  HeadMeasurementFormView({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeasurementAppbarWidget(
        appbarTitle: "Head Circumference",
      ),
      body: BlocConsumer<MeasurementBloc, MeasurementState>(
        listenWhen: (previous, current) =>
            previous.isSuccess != current.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) {
            context.pushReplacementNamed(
              AppRoutesEnum.main.name,
              extra: {"index": 2},
            );
          }
        },
        builder: (context, state) => Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpacersVertical.spacer34,
                AppText.poppinsBold(
                  "Head Circumference",
                  fontSize: 20,
                  height: 28 / 20,
                  color: AppColors.black,
                ),
                SpacersVertical.spacer8,
                AppText.poppinsRegular(
                  "Answer these questions, & we'll suggest ideal headwear choices tailored to your size.",
                  fontSize: 14,
                  height: 22 / 14,
                  color: AppColors.black.withValues(alpha: 0.6),
                  letterSpacing: 0.02 * 14,
                  textAlign: TextAlign.center,
                ),
                SpacersVertical.spacer26,
                FittedInputField.withIcon(
                  initialValue:
                      state.otherMeasurementModel.head.value.toString(),
                  validator: InputValidators.notEmpty(),
                  spacing: SpacersVertical.spacer8,
                  label: "Head Circumference",
                  hint: "eg. 150",
                  keyboardType: TextInputType.number,
                  onChanged: (p0) {
                    if (p0.isNotEmpty) {
                      context
                          .read<MeasurementBloc>()
                          .add(UpdateOtherMeasurement(
                            field: OtherMeasurementsEnum.head,
                            value: Measurement(
                                value: num.parse(p0),
                                unit: state.otherMeasurementModel.head.unit),
                          ));
                    }
                  },
                  suffixIcon: UnitDropdown(
                    selectedUnit: state.otherMeasurementModel.head.unit,
                    field: OtherMeasurementsEnum.head,
                    value: state.otherMeasurementModel.head.value,
                  ),
                ),
                Spacer(),
                state.isLoading
                    ? LoadingIndicator()
                    : CustomButton(
                        onTap: () => _formKey.currentState!.validate()
                            ? context
                                .read<MeasurementBloc>()
                                .add(AddMeasurements())
                            : null,
                        text: "Save",
                        width: 336,
                        height: 52,
                      ),
                SpacersVertical.spacer34,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
