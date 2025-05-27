import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/presentation/widgets/height_slider.dart';
import 'package:fitted/features/measurement/presentation/widgets/unit_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetHeightWidget extends StatelessWidget {
  const SetHeightWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final state = context.watch<MeasurementBloc>().state;
    return Column(
      children: [
        FittedImageProvider.localAsset(
          imagePath: AppImages.tall,
          imageSize: Size(245.w, 231.h),
          boxFit: BoxFit.cover,
        ),
        SpacersVertical.spacer20,
        AppText.poppinsMedium(
          "How tall are you?",
          fontSize: 25,
          height: 32 / 25,
          color: AppColors.tealPrimary,
        ),
        SpacersVertical.spacer18,
        SizedBox(
          width: 370.w,
          child: AppText.poppinsRegular(
            "Enter your height",
            fontSize: 16,
            height: 24 / 16,
            color: AppColors.tealSecondary,
            textAlign: TextAlign.center,
          ),
        ),
        SpacersVertical.spacer50,
        UnitSwitcher(),
        SpacersVertical.spacer44,
        HeightSliderWidget(
          state: state,
        ),
        SpacersVertical.spacer64,
        CustomButton(
          text: 'Next',
          onTap: () {
            context.read<MeasurementBloc>().add(IncrementIndex());
          },
        ),
      ],
    );
  }
}
