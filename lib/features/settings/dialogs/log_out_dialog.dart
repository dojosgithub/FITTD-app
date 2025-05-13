import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      height: 284.h,
      width: 308.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FittedImageProvider.localSvg(
            imagePath: AppVectors.signOutColored,
            imageSize: Size(56.w, 56.h),
          ),
          AppText.poppinsSemiBold(
            "Logout from the app?",
            fontSize: 16,
            height: 24 / 16,
            color: AppColors.deepBurgundy,
          ),
          Opacity(
            opacity: 0.6,
            child: AppText.poppinsMedium(
              "Are your sure you want to log out? Logging out won’t affect your data.Once you logout you will have to enter your password to login again.",
              fontSize: 12,
              height: 18 / 12,
              letterSpacing: 0.01 * 12,
              textAlign: TextAlign.center,
              color: AppColors.deepBurgundy.withValues(
                alpha: 0.6,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton.outline(
                onTap: () => context.pop(),
                text: "Go Back",
                width: 128.w,
                height: 52,
                textStyle: AppTextStyles.poppinsBold(
                  fontSize: 16,
                  height: 24 / 16,
                  color: AppColors.orangePrimary,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              CustomButton(
                text: "Logout",
                width: 128.w,
                height: 52,
                borderRadius: BorderRadius.circular(10.r),
              )
            ],
          )
        ],
      ),
    );
  }
}
