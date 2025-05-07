import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 145.h, bottom: 54.h),
        child: Column(
          children: <Widget>[
            FittedImageProvider.localAsset(
              imagePath: AppImages.welcome,
              imageSize: Size(354.w, 178.h),
              boxFit: BoxFit.cover,
            ),
            SpacersVertical.spacer36,
            AppText.poppinsMedium(
              "Welcome to Fittd",
              fontSize: 32,
              height: 1,
              color: AppColors.tealPrimary,
            ),
            SpacersVertical.spacer20,
            AppText.poppinsRegular(
              "We will help you to pick the best fit clothes exactly for you, let’s do it!",
              fontSize: 16,
              height: 24 / 16,
              color: AppColors.tealSecondary,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            CustomButton(
              text: "Get Started",
            ),
          ],
        ),
      ),
    );
  }
}
