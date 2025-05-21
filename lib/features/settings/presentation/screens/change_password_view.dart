import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          bottom: 40.h,
          top: 68.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedButton(
              onTap: () => context.pop(),
              child: Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: FittedImageProvider.localSvg(
                  imagePath: AppVectors.backArrow2,
                  imageSize: Size(13.w, 17.h),
                  boxFit: BoxFit.contain,
                ),
              ),
            ),
            SpacersVertical.spacer16,
            AppText.poppinsRegular(
              'Change Password',
              fontSize: 27,
              color: AppColors.deepBurgundy,
            ),
            SpacersVertical.spacer26,
            AppText.poppinsRegular(
              'My Password',
              fontSize: 22,
              color: AppColors.deepBurgundy,
            ),
            SpacersVertical.spacer28,
            FittedInputField.password(
              width: 1.sw,
              label: "Current Password",
              isHidden: true,
              onToggle: () {},
            ),
            SpacersVertical.spacer28,
            FittedInputField.confirmPassword(
              width: 1.sw,
              label: "New Password",
              confirmController: TextEditingController(),
              originalController: TextEditingController(),
              isHidden: true,
              onToggle: () {},
            ),
            SpacersVertical.spacer40,
            Center(
              child: CustomButton(
                text: "Update Password",
              ),
            )
          ],
        ),
      ),
    );
  }
}
