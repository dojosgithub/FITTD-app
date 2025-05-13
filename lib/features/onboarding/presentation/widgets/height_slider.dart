import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/features/onboarding/data/enums/female_measurement_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheel_slider/wheel_slider.dart';

import '../../../../config/colors/colors.dart';
import '../bloc/bloc.dart';
import '../../data/enums/male_measurement_enum.dart';
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
    final bool isMale = state.style == "male";

    if (isMale) {
      final measurement = state.maleMeasurementModel;
      return buildSlider(
          context, measurement.height.value, measurement.height.unit, isMale);
    } else if (!isMale) {
      final measurement = state.femaleMeasurementModel;
      return buildSlider(
          context, measurement.height.value, measurement.height.unit, isMale);
    } else {
      return const SizedBox.shrink(); // Or show a loader / placeholder
    }
  }

  Widget buildSlider(BuildContext context, num value, Unit unit, bool isMale) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: unit.name,
                style: AppTextStyles.poppinsLight(
                  fontSize: 18,
                  color: AppColors.tealSecondary,
                ),
              ),
            ],
            text: value.toString(),
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
              stops: [0.0, 0.3, 0.7, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: WheelSlider(
            totalCount: unit == Unit.inch ? 107 : 251,
            initValue: value,
            isInfinite: false,
            lineColor: AppColors.tealAccent,
            pointerColor: AppColors.tealAccent,
            onValueChanged: (newValue) {
              context.read<OnboardingBloc>().add(
                    UpdateMeasurement(
                      field: isMale
                          ? MaleMeasurementEnum.height
                          : FemaleMeasurementEnum.height,
                      value: Measurement(
                        value: newValue,
                        unit: unit,
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
