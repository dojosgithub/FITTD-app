import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/auth/forgot_password/presentation/widgets/change_password_form.dart';
import 'package:fitted/features/auth/widgets/back_to_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

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
                  imagePath: AppVectors.key,
                ),
                SpacersVertical.spacer20,
                SpacersVertical.spacer2,
                AppText.poppinsSemiBold(
                  "Set new password",
                  fontSize: 24,
                  height: 32 / 24,
                  color: AppColors.tealPrimary,
                ),
                SpacersVertical.spacer4,
                AppText.poppinsRegular(
                  "Your new password must be different to previously used passwords.",
                  fontSize: 16,
                  height: 24 / 16,
                  color: AppColors.tealSecondary,
                  textAlign: TextAlign.center,
                ),
                SpacersVertical.spacer32,
                ChangePasswordFormWidget(),
                SpacersVertical.spacer30,
                BackToLoginWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
