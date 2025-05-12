import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/onboarding/presentation/widgets/female/widget/upper_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FemaleUpperMeasureWidget extends StatelessWidget {
  const FemaleUpperMeasureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedImageProvider.localAsset(
          imagePath: AppImages.measurement,
          imageSize: Size(245.w, 231.h),
          boxFit: BoxFit.cover,
        ),
        SpacersVertical.spacer28,
        AppText.poppinsMedium(
          "Enter your measurements",
          fontSize: 25,
          height: 32 / 25,
          color: AppColors.tealPrimary,
        ),
        SpacersVertical.spacer16,
        SizedBox(
          width: 370.w,
          child: AppText.poppinsRegular(
            "Measure each category below",
            fontSize: 16,
            height: 24 / 16,
            color: AppColors.tealSecondary,
            textAlign: TextAlign.center,
          ),
        ),
        SpacersVertical.spacer44,
        FemaleUpperForm(),
      ],
    );
  }
}
