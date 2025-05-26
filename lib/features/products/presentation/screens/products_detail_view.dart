import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/features/main/data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import '../widgets/curved_painter.dart';

class ProductsDetailView extends StatelessWidget {
  const ProductsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 16.0, left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    RoundedButton(
                      onTap: () => context.pop(),
                      child: Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: FittedImageProvider.localSvg(
                          imagePath: AppVectors.heart,
                          imageSize: Size(13.w, 17.h),
                          boxFit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: FittedImageProvider.network(
                    imagePath: HomeMockData.productImg1,
                    imageSize: Size(298.w, 340.w),
                    boxFit: BoxFit.cover,
                  ),
                ),
                Curved360Overlay(),
                Center(
                  child: Container(
                    height: 17.h,
                    width: 67.w,
                    decoration: BoxDecoration(
                      color: Color(0xffF9F9F9),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 3.h,
                      child: Center(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) => Center(
                            child: Container(
                              width: index == 0 ? 16.w : 7.w,
                              height: 3.h,
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration: BoxDecoration(
                                color: index == 0
                                    ? AppColors.orangePrimary
                                    : AppColors.orangePrimary
                                        .withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(21.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SpacersVertical.spacer42,
                AppText.poppinsMedium(
                  "Tommy Hilfiger",
                  fontSize: 16,
                  height: 24 / 16,
                  color: AppColors.charcoal.withValues(alpha: 0.8),
                ),
                SpacersVertical.spacer12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.poppinsRegular(
                      "Diesel Jeans RB",
                      fontSize: 27,
                      color: AppColors.tealPrimary,
                    ),
                    AppText.poppinsExtraBold(
                      "\$127",
                      fontSize: 24,
                      height: 32 / 24,
                      color: AppColors.black,
                    ),
                  ],
                ),
                SpacersVertical.spacer8,
                Row(
                  children: [
                    FittedImageProvider.localSvg(
                        imagePath: AppVectors.star,
                        imageSize: Size(16.w, 16.h),
                        boxFit: BoxFit.contain),
                    Spacers.spacer10,
                    AppText.poppinsRegular(
                      "3.5 (1055 Reviews)",
                      fontSize: 17,
                      height: 22 / 17,
                      color: AppColors.tealSecondary,
                    ),
                  ],
                ),
                SpacersVertical.spacer42,
                AppText.poppinsRegular(
                  "Select Color",
                  fontSize: 22,
                  color: AppColors.tealPrimary,
                ),
                SpacersVertical.spacer20,
                SizedBox(
                  width: 1.sw,
                  height: 85.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.r),
                          border: Border.all(
                            width: 1,
                            color: index == 1
                                ? AppColors.orangePrimary
                                : AppColors.black.withValues(alpha: 0.04),
                          ),
                        ),
                        padding: EdgeInsets.all(12),
                        child: FittedImageProvider.network(
                          imagePath: HomeMockData.productImg1,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SpacersVertical.spacer38,
                AppText.poppinsSemiBold(
                  "Fit",
                  fontSize: 16,
                  height: 24 / 16,
                  color: AppColors.tealPrimary,
                ),
                SpacersVertical.spacer8,
                SizedBox(
                  height: 34.h,
                  child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: fitList.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => Spacers.spacer10,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 34.h,
                          decoration: BoxDecoration(
                            color: index == 0 ? AppColors.orangePrimary : null,
                            borderRadius: BorderRadius.circular(40.r),
                            border: Border.all(
                              color: index == 0
                                  ? AppColors.orangePrimary
                                  : AppColors.grey,
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          child: AppText.poppinsRegular(
                            fitList[index],
                            fontSize: 12,
                            height: 18 / 12,
                            color:
                                index == 0 ? AppColors.white : AppColors.black,
                          ),
                        );
                      }),
                ),
                SpacersVertical.spacer36,
                AppText.poppinsRegular(
                  "Select Size",
                  fontSize: 22,
                  color: AppColors.tealPrimary,
                ),
                SpacersVertical.spacer18,
                SizedBox(
                  width: 1.sw,
                  height: 85.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      sizeList.length,
                      (index) => Container(
                        width: 85.w,
                        height: 85.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            width: 1,
                            color: AppColors.black.withValues(alpha: 0.04),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: AppText.poppinsRegular(
                          sizeList[index],
                          fontSize: 22,
                          color: AppColors.tealPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                SpacersVertical.spacer48,
                AppText.poppinsRegular(
                  "Description",
                  fontSize: 22,
                  color: AppColors.tealPrimary,
                ),
                SpacersVertical.spacer20,
                AppText.poppinsRegular(
                  "Crypto ipsum bitcoin ethereum dogecoin litecoin. Ethereum stellar secret WAX livepeer kadena PancakeSwap.. Dogecoin polkadot cosmos revain crypto.",
                  fontSize: 16,
                  height: 24 / 16,
                  color: AppColors.tealSecondary,
                  letterSpacing: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List fitList = [
  "Tight",
  "Fitted",
  "Loose",
];

List sizeList = [
  "S",
  "M",
  "L",
  "XL",
];
