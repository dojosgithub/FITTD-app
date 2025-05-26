import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../features/main/data/mock_data.dart';
import '../assets/icons.dart';
import '../colors/colors.dart';
import '../helper/image_provider/fitted_image_provider.dart';
import '../router/app_routes.dart';
import 'app_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.height});

  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutesEnum.productsDetailView.name,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 171.w,
            height: height ?? 195.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              border: Border.all(
                width: 1,
                color: AppColors.black.withValues(alpha: 0.04),
              ),
            ),
            padding: EdgeInsets.all(12),
            child: Stack(
              alignment: Alignment.center,
              children: [
                FittedImageProvider.network(
                  imagePath: HomeMockData.productImg1,
                  imageSize: Size(107.w, 163.h),
                  boxFit: BoxFit.cover,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: FittedImageProvider.localSvg(
                    imagePath: AppVectors.heartFilled,
                    imageSize: Size.square(20),
                    boxFit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SpacersVertical.spacer8,
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6.h,
              children: [
                AppText.poppinsMedium(
                  "Dior Vest Cargo-Blue",
                  fontSize: 14,
                  height: 22 / 14,
                  color: AppColors.tealPrimary,
                ),
                AppText.poppinsLight(
                  "\$9225",
                  fontSize: 14,
                  height: 22 / 14,
                  color: AppColors.tealSecondary,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
