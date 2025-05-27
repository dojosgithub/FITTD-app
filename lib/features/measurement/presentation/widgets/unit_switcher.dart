import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/data/enums/female_measurement_enum.dart';
import 'package:fitted/features/measurement/data/models/measurement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/enums/male_measurement_enum.dart';
import '../../data/enums/unit_enum.dart';

class UnitSwitcher extends StatelessWidget {
  const UnitSwitcher({super.key});
  @override
  Widget build(BuildContext context) {
    final unit = context.select<MeasurementBloc, Unit>((bloc) =>
        bloc.state.style == "male"
            ? bloc.state.maleMeasurementModel.height.unit
            : bloc.state.femaleMeasurementModel.height.unit);
    return Container(
      width: 150.w,
      height: 38.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44.r),
        border: Border.all(
          color: AppColors.orangePrimary.withValues(
            alpha: .2,
          ),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: unit == Unit.inch
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              width: 81.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.orangePrimary,
                borderRadius: BorderRadius.circular(44.r),
              ),
            ),
          ),
          Row(
            children: [
              _buildOption("In", Unit.inch, context),
              _buildOption("Cm", Unit.cm, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String label, Unit unit, BuildContext context) {
    final bloc = context.read<MeasurementBloc>();
    final state = bloc.state;
    final isMale = state.style == "male";

    final currentMeasurement = isMale
        ? state.maleMeasurementModel.height
        : state.femaleMeasurementModel.height;

    final isSelected = currentMeasurement.unit == unit;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!isSelected) {
            final currentValue = currentMeasurement.value;

            final field = isMale
                ? MaleMeasurementEnum.height
                : FemaleMeasurementEnum.height;

            final double convertedValue = unit == Unit.inch
                ? (currentValue / 2.54) // cm → inch
                : (currentValue * 2.54); // inch → cm

            bloc.add(
              UpdateMeasurement(
                field: field,
                value: Measurement(value: convertedValue, unit: unit),
              ),
            );
          }
        },
        child: Container(
          alignment: Alignment.center,
          child: AppText.poppinsSemiBold(
            label,
            fontSize: 17,
            height: 22 / 17,
            color: isSelected ? AppColors.white : AppColors.tealPrimary,
          ),
        ),
      ),
    );
  }
}
