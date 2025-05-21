import 'package:fitted/config/router/app_routes.dart';
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
          CustomButton(
            text: "Update",
            width: 280.w,
            height: 52,
            onTap: () =>
                context.pushNamed(AppRoutesEnum.main.name, extra: {"index": 2}),
          )
        ],
      ),
    );
  }
}
