import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/data/enums/female_measurement_enum.dart';
import 'package:fitted/features/measurement/data/models/measurement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/enums/unit_enum.dart';

class UnitSwitcher extends StatelessWidget {
  const UnitSwitcher({super.key, required this.selectedUnit});
  final Unit selectedUnit;
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
    final state = context.read<MeasurementBloc>().state;
    final currentUnit = state.style == "male"
        ? state.maleMeasurementModel.height.unit
        : state.femaleMeasurementModel.height.unit;
    final isSelected = currentUnit == unit;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!isSelected) {
            final currentValue = state.style == "male"
                ? state.maleMeasurementModel.height.value
                : state.femaleMeasurementModel.height.value;
            context.read<MeasurementBloc>().add(
                  UpdateMeasurement(
                    field: FemaleMeasurementEnum.height,
                    value: Measurement(value: currentValue, unit: unit),
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
