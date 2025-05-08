import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheel_slider/wheel_slider.dart';

import '../../../../config/colors/colors.dart';
import '../../bloc/bloc.dart';
import '../../data/enums/unit_enum.dart';

class HeightSliderWidget extends StatelessWidget {
  const HeightSliderWidget({
    super.key,
    required this.state,
  });
  final OnboardingState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: state.selectedUnit.name.substring(0, 2),
                style: AppTextStyles.poppinsLight(
                  fontSize: 18,
                  color: AppColors.tealSecondary,
                ),
              ),
            ],
            text: state.selectedUnit == Unit.inch
                ? state.heightIn.toString()
                : state.heightCm.toString(),
            style: AppTextStyles.poppinsLight(
              fontSize: 38,
              color: AppColors.tealSecondary,
            ),
          ),
        ),
        SpacersVertical.spacer2,
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.transparent,
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              stops: [0.0, 0.3, 0.7, 1.0], // fade in and out
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn, // keeps only overlapping parts
          child: WheelSlider(
            totalCount: state.selectedUnit == Unit.inch ? 107 : 251,
            initValue: state.selectedUnit == Unit.inch
                ? state.heightIn
                : state.heightCm,
            isInfinite: false,
            lineColor: AppColors.tealAccent,
            pointerColor: AppColors.tealAccent,
            onValueChanged: (value) {
              context.read<OnboardingBloc>().add(
                    ChangeHeight(
                      height: (value),
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }
}
