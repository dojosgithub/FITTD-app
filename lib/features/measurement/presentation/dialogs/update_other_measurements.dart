import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';

import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/assets/icons.dart';

class UpdateOtherMeasurements extends StatelessWidget {
  const UpdateOtherMeasurements({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      height: 333.h,
      width: 328.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedImageProvider.localSvg(
            imagePath: AppVectors.update,
            imageSize: Size(91.w, 70.h),
          ),
          AppText.poppinsBold(
            "Update other measurements!!",
            fontSize: 18,
            height: 28 / 18,
            color: AppColors.deepBurgundy,
            textAlign: TextAlign.center,
          ),
          AppText.poppinsRegular(
            "If you want to see sunglasses, Shoes, and hats, please update your face, head, and foot measurements.",
            fontSize: 14,
            height: 22 / 14,
            textAlign: TextAlign.center,
            color: AppColors.black.withValues(
              alpha: 0.6,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton.outline(
                onTap: () => context.pop(),
                text: "Cancel",
                width: 140.w,
                height: 42,
                textStyle: AppTextStyles.poppinsBold(
                  fontSize: 16,
                  height: 24 / 16,
                  color: AppColors.orangePrimary,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              CustomButton(
                text: "Update",
                width: 140.w,
                height: 42,
                onTap: () => context.pushNamed(
                  AppRoutesEnum.main.name,
                  extra: {"index": 2},
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ],
          )
        ],
      ),
    );
  }
}
