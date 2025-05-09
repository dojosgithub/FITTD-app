import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/features/onboarding/data/enums/female_measurement_enum.dart';
import 'package:fitted/features/onboarding/data/models/female_measurement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheel_slider/wheel_slider.dart';

import '../../../../config/colors/colors.dart';
import '../../bloc/bloc.dart';
import '../../data/enums/unit_enum.dart';
import '../../data/models/measurement_model.dart';

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
                text: state.measurements.height.unit.name,
                style: AppTextStyles.poppinsLight(
                  fontSize: 18,
                  color: AppColors.tealSecondary,
                ),
              ),
            ],
            text: state.measurements.height.value.toString(),
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
            totalCount: state.measurements.height.unit == Unit.inch ? 107 : 251,
            initValue: state.measurements.height.value,
            isInfinite: false,
            lineColor: AppColors.tealAccent,
            pointerColor: AppColors.tealAccent,
            onValueChanged: (value) {
              context.read<OnboardingBloc>().add(
                    UpdateMeasurement(
                      field: FemaleMeasurementEnum.height,
                      value: Measurement(
                        value: value,
                        unit: state.measurements.height.unit,
                      ),
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }
}
