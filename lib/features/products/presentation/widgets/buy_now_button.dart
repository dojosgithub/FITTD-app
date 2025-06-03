import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    super.key,
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      width: 363.w,
      decoration: BoxDecoration(
        color: AppColors.orangePrimary,
        borderRadius: BorderRadius.circular(90.r),
      ),
      padding: EdgeInsets.all(12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.poppinsRegular(
            price,
            fontSize: 22,
            height: 24 / 22,
            letterSpacing: 0,
            color: AppColors.white,
          ),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutesEnum.productUrlDialog.name),
            child: Container(
              height: 48.h,
              width: 135.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(90.r),
              ),
              padding: EdgeInsets.all(12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12.w,
                children: [
                  FittedImageProvider.localSvg(
                    imagePath: AppVectors.wishlist,
                    imageSize: Size(18.w, 17.h),
                    boxFit: BoxFit.contain,
                  ),
                  AppText.poppinsSemiBold(
                    "Buy Now",
                    fontSize: 13,
                    height: 24 / 13,
                    letterSpacing: 0,
                    color: AppColors.tealPrimary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
