import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/features/measurement/data/enums/female_measurement_enum.dart';
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
  final MeasurementState state;
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
            children: unit == Unit.inch
                ? _buildFeetInchesTextSpans(value)
                : [
                    TextSpan(
                      text: value.toStringAsFixed(0),
                      style: AppTextStyles.poppinsLight(
                        fontSize: 38,
                        color: AppColors.tealSecondary,
                      ),
                    ),
                    TextSpan(
                      text: ' ${unit.name}',
                      style: AppTextStyles.poppinsLight(
                        fontSize: 18,
                        color: AppColors.tealSecondary,
                      ),
                    ),
                  ],
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
            totalCount: unit == Unit.inch ? 610 : 1530,
            initValue: value,
            isInfinite: false,
            lineColor: AppColors.tealAccent,
            pointerColor: AppColors.tealAccent,
            onValueChanged: (newValue) {
              context.read<MeasurementBloc>().add(
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

List<TextSpan> _buildFeetInchesTextSpans(num inchValue) {
  final feet = inchValue ~/ 12;
  final inches = (inchValue % 12).round();

  final spans = <TextSpan>[];

  if (feet > 0) {
    spans.addAll([
      TextSpan(
        text: "$feet ",
        style: AppTextStyles.poppinsLight(
          fontSize: 38,
          color: AppColors.tealSecondary,
        ),
      ),
      TextSpan(
        text: "ft ",
        style: AppTextStyles.poppinsLight(
          fontSize: 18,
          color: AppColors.tealSecondary,
        ),
      ),
    ]);
  }

  if (inches > 0) {
    spans.addAll([
      TextSpan(
        text: "$inches ",
        style: AppTextStyles.poppinsLight(
          fontSize: 38,
          color: AppColors.tealSecondary,
        ),
      ),
      TextSpan(
        text: "in",
        style: AppTextStyles.poppinsLight(
          fontSize: 18,
          color: AppColors.tealSecondary,
        ),
      ),
    ]);
  }

  return spans;
}
