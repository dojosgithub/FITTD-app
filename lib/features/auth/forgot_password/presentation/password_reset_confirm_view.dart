import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PasswordResetConfirmView extends StatelessWidget {
  const PasswordResetConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 96.w),
        child: Center(
          child: SizedBox(
            width: 342.w,
            child: Column(
              children: [
                FittedImageProvider.localSvg(
                  imagePath: AppVectors.check,
                ),
                SpacersVertical.spacer20,
                SpacersVertical.spacer2,
                AppText.poppinsSemiBold(
                  "Password reset",
                  fontSize: 24,
                  height: 32 / 24,
                  color: AppColors.tealPrimary,
                ),
                SpacersVertical.spacer4,
                AppText.poppinsRegular(
                  "Your password has been successfully reset. Click below to log in magically.",
                  fontSize: 16,
                  height: 24 / 16,
                  color: AppColors.tealSecondary,
                  textAlign: TextAlign.center,
                ),
                SpacersVertical.spacer32,
                CustomButton(
                  text: "Continue",
                  onTap: () {
                    context.pushReplacementNamed(AppRoutesEnum.login.name);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
