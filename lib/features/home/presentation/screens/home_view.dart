import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/features/main/data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 22.0, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 12.w,
              children: [
                FittedImageProvider.circularNetwork(
                  imagePath: HomeMockData.avatarImg,
                  imageSize: Size(48.w, 48.h),
                  boxFit: BoxFit.cover,
                ),
                AppText.poppinsMedium(
                  "Hello Ashleigh",
                  fontSize: 17,
                  height: 22 / 17,
                  color: AppColors.tealPrimary,
                ),
                Spacer(),
                RoundedButton(
                  child: FittedImageProvider.localSvg(
                    imagePath: AppVectors.notification,
                    imageSize: Size(18.w, 17.h),
                    boxFit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SpacersVertical.spacer2,
            FittedInputField.withIcon(
              height: 48.h,
              width: 0.9.sw,
              hint: "Search for...",
              hintStyle: AppTextStyles.poppinsRegular(
                fontSize: 13,
                height: 22 / 13,
                color: AppColors.tealSecondary,
              ),
              label: "",
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                  child: FittedImageProvider.localSvg(
                    imagePath: AppVectors.filter,
                    imageSize: Size(18.w, 17.h),
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: FittedImageProvider.localSvg(
                  imagePath: AppVectors.search,
                  imageSize: Size(8.w, 8.h),
                  boxFit: BoxFit.contain,
                ),
              ),
            ),
            SpacersVertical.spacer40,
            Container(
              width: 362.w,
              height: 186.h,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
                color: AppColors.tealPrimary,
                borderRadius: BorderRadius.circular(9.r),
                image: DecorationImage(
                    image: AssetImage(
                      AppImages.homeBanner,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                spacing: 4.h,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.h,
                    children: [
                      AppText.poppinsRegular(
                        "Welcome Back",
                        fontSize: 23,
                        height: 22 / 23,
                        color: AppColors.white,
                      ),
                      AppText.poppinsRegular(
                        "Let’s find the perfect fit",
                        fontSize: 16,
                        height: 24 / 16,
                        color: AppColors.tealSecondary,
                      ),
                    ],
                  ),
                  CustomButton(
                    text: "Start Shopping",
                    textStyle: AppTextStyles.poppinsSemiBold(
                      fontSize: 13,
                      height: 24 / 13,
                      color: AppColors.white,
                    ),
                    width: 148.w,
                    height: 44.h,
                  ),
                ],
              ),
            ),
            SpacersVertical.spacer56,
            AppText.poppinsRegular(
              "Brands you love",
              fontSize: 27,
              height: 22 / 27,
              color: AppColors.tealPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
