import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/measurement/data/enums/other_measurements_enum.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/helper/form_validation/form_validator.dart';
import '../../../../config/helper/spacers/spacers.dart';
import '../../../../config/widgets/app_text.dart';
import '../../../../config/widgets/input_feild.dart';
import '../../data/models/measurement_model.dart';
import '../widgets/measurement_appbar.dart';
import '../widgets/show_image_picker.dart';
import '../widgets/show_picked_image.dart';
import '../widgets/unit_dropdown.dart';

class FaceMeasurementFormView extends StatelessWidget {
  const FaceMeasurementFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeasurementAppbarWidget(
        appbarTitle: "Face Measurement",
      ),
      body: BlocBuilder<MeasurementBloc, MeasurementState>(
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpacersVertical.spacer34,
              AppText.poppinsBold(
                "Face Measurement",
                fontSize: 20,
                height: 28 / 20,
                color: AppColors.black,
              ),
              SpacersVertical.spacer8,
              AppText.poppinsRegular(
                "Answer these questions, & we'll suggest your face type & sunglasses that suits the ideal type.",
                fontSize: 14,
                height: 22 / 14,
                color: AppColors.black.withValues(alpha: 0.6),
                letterSpacing: 0.02 * 14,
                textAlign: TextAlign.center,
              ),
              SpacersVertical.spacer26,
              FittedInputField.withIcon(
                validator: InputValidators.notEmpty(),
                spacing: SpacersVertical.spacer8,
                label: "Face Length",
                hint: "eg. 150",
                keyboardType: TextInputType.number,
                onChanged: (p0) {
                  if (p0.isNotEmpty) {
                    context.read<MeasurementBloc>().add(UpdateMeasurement(
                          field: OtherMeasurementsEnum.face,
                          value: Measurement(
                              value: num.parse(p0),
                              unit: state.otherMeasurementModel.face.unit),
                        ));
                  }
                },
                suffixIcon: UnitDropdown(
                  selectedUnit: state.otherMeasurementModel.face.unit,
                  field: OtherMeasurementsEnum.face,
                  value: state.otherMeasurementModel.face.value,
                ),
              ),
              SpacersVertical.spacer24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 0.3.sw,
                    child: Divider(
                      thickness: 1,
                      color: AppColors.grey,
                    ),
                  ),
                  AppText.poppinsRegular(
                    "Continue with",
                    fontSize: 12,
                    height: 18 / 12,
                    color: AppColors.black.withValues(alpha: 0.6),
                  ),
                  SizedBox(
                    width: 0.3.sw,
                    child: Divider(
                      thickness: 1,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              SpacersVertical.spacer32,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: AppText.poppinsRegular(
                  "Upload the image here and we will try to find out the suits.",
                  fontSize: 14,
                  height: 22 / 14,
                  color: AppColors.black.withValues(alpha: 0.6),
                  letterSpacing: 0.02 * 14,
                  textAlign: TextAlign.center,
                ),
              ),
              SpacersVertical.spacer10,
              state.image != null
                  ? ShowPickedImage(image: state.image)
                  : ShowImagePicker(image: state.image),
              Spacer(),
              CustomButton(
                text: "Save",
                width: 336.w,
                height: 52.h,
              ),
              SpacersVertical.spacer34,
            ],
          ),
        ),
      ),
    );
  }
}
