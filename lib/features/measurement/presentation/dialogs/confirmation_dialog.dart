import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/widgets/app_text.dart';
import '../../../../../config/assets/icons.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FittedImageProvider.localSvg(
            imagePath: AppVectors.confirmation,
            imageSize: Size(180.w, 160.h),
          ),
          AppText.poppinsBold(
            "Measurements confirmed!!",
            fontSize: 20,
            height: 28 / 20,
            color: AppColors.deepBurgundy,
          ),
          AppText.poppinsMedium(
            "We're on a quest to find you the finest clothing that perfectly matches your measurements.",
            fontSize: 14,
            height: 22 / 14,
            textAlign: TextAlign.center,
            color: AppColors.black.withValues(
              alpha: 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
