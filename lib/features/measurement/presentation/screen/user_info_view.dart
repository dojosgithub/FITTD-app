import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/choose_height.dart';
import '../widgets/choose_your_fit.dart';
import '../widgets/choose_your_style.dart';
import '../widgets/female/enter_measurements_lower.dart';
import '../widgets/female/enter_measurements_upper.dart';
import '../widgets/male/enter_measurements_lower.dart';
import '../widgets/male/enter_measurements_upper.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MeasurementBloc, MeasurementState>(
        builder: (context, state) {
          final widgets = _buildOnboardingWidgets(state);

          return SingleChildScrollView(
            child: Column(
              children: [
                _buildProgressIndicator(state, widgets.length),
                widgets[state.currentIndex.clamp(0, widgets.length - 1)],
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildOnboardingWidgets(MeasurementState state) {
    return [
      const ChooseYourStyleWidget(),
      const ChooseYourFitWidget(),
      const SetHeightWidget(),
      if (state.style == "male") ...[
        const MaleUpperMeasureWidget(),
        const MaleLowerMeasureWidget(),
      ] else if (state.style == "female") ...[
        const FemaleUpperMeasureWidget(),
        const FemaleLowerMeasureWidget(),
      ],
    ];
  }

  Widget _buildProgressIndicator(MeasurementState state, int length) {
    return Container(
      margin: EdgeInsets.only(
        top: 82.h,
        bottom: state.currentIndex != 2 ? 80 : 28,
      ),
      width: 1.sw,
      height: 6,
      alignment: Alignment.center,
      child: ListView.separated(
        itemCount: length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (context, index) => Spacers.spacer8,
        itemBuilder: (context, index) => Container(
          width: 59,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(43.r),
            color: index <= state.currentIndex
                ? AppColors.orangePrimary
                : AppColors.grey.withValues(alpha: 0.4),
          ),
        ),
      ),
    );
  }
}
