import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/onboarding/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/enums/unit_enum.dart';

class UnitSwitcher extends StatelessWidget {
  const UnitSwitcher({super.key, required this.selectedUnit});
  final Unit selectedUnit;
  @override
  Widget build(BuildContext context) {
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
            alignment: selectedUnit == Unit.inch
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
    final isSelected = selectedUnit == unit;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!isSelected) {
            context.read<OnboardingBloc>().add(
                  ChangeUnit(
                    selectedUnit: unit,
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
