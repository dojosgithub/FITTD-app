import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../config/widgets/app_text.dart';
import '../../main/data/mock_data.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

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
            SpacersVertical.spacer18,
            AppText.poppinsRegular(
              ' Profile Information',
              fontSize: 27,
              color: AppColors.deepBurgundy,
            ),
            SpacersVertical.spacer34,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FittedImageProvider.circularNetwork(
                  imagePath: HomeMockData.avatarImg,
                  imageSize: Size.square(134.w),
                  boxFit: BoxFit.cover,
                ),
                CustomButton.icon(
                  text: "Upload New",
                  icon: AppVectors.upload,
                  iconSize: Size(24.w, 24.h),
                  width: 197.w,
                  height: 48.h,
                ),
              ],
            ),
            SpacersVertical.spacer34,
            Divider(
              color: AppColors.deepBurgundy.withValues(alpha: 0.14),
            ),
            SpacersVertical.spacer42,
            FittedInputField(
              label: "First Name",
              width: 1.sw,
            ),
            SpacersVertical.spacer28,
            FittedInputField(
              label: "Last Name",
              width: 1.sw,
            ),
            SpacersVertical.spacer32,
            FittedInputField(
              label: "Email",
              width: 1.sw,
            ),
            Spacer(),
            Center(
              child: CustomButton(
                text: "Upload New",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
