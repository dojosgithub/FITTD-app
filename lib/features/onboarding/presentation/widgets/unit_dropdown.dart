import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/features/onboarding/data/enums/female_measurement_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/colors/colors.dart';
import '../../bloc/bloc.dart';
import '../../data/enums/unit_enum.dart';
import '../../data/models/female_measurement_model.dart';
import '../../data/models/measurement_model.dart';

class UnitDropdown extends StatelessWidget {
  final Unit selectedUnit;
  final FemaleMeasurementEnum feild;
  final num value;

  const UnitDropdown({
    super.key,
    required this.selectedUnit,
    required this.feild,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        width: 87.25.w,
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 9.w),
        decoration: BoxDecoration(
          color: AppColors.orangePrimary,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: DropdownButton<Unit>(
          value: selectedUnit,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 24.w,
            color: AppColors.white,
          ),
          dropdownColor: AppColors.orangePrimary,
          style: AppTextStyles.poppinsSemiBold(
            fontSize: 20,
            height: 28 / 20,
            color: AppColors.white,
          ),
          isExpanded: true,
          underline: SizedBox(),
          onChanged: (Unit? newValue) {
            context.read<OnboardingBloc>().add(
                  UpdateMeasurement(
                    field: feild,
                    value: Measurement(
                      value: value,
                      unit: newValue!,
                    ),
                  ),
                );
          },
          items: Unit.values.map((unit) {
            return DropdownMenuItem<Unit>(
              value: unit,
              child: Text(
                unit.name,
                style: AppTextStyles.poppinsSemiBold(
                  fontSize: 20,
                  height: 28 / 20,
                  color: AppColors.white,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
