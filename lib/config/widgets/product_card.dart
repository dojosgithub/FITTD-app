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
  const ProductCard({
    super.key,
    this.name = "",
    this.price = "",
    this.id = "",
    this.image = HomeMockData.productImg1,
    this.isLiked = false,
    required this.onTap,
    required this.alterationRequired,
  });

  final String name;
  final String price;
  final bool isLiked;
  final String image;
  final bool alterationRequired;
  final String id;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutesEnum.productsDetailView.name,
        extra: {"id": id},
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              border: Border.all(
                width: 1,
                color: AppColors.black.withValues(alpha: 0.04),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                FittedImageProvider.roundedRect(
                  imagePath: image,
                  imageSize: Size(171.w, 195.h),
                  boxFit: BoxFit.cover,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(9.r),
                    bottomRight: Radius.circular(9.r),
                  ),
                  childImageType: AppImageType.network,
                ),
                Positioned(
                  top: 10,
                  right: 12,
                  child: GestureDetector(
                    onTap: onTap,
                    child: FittedImageProvider.localSvg(
                      imagePath:
                          isLiked ? AppVectors.heartFilled : AppVectors.heart,
                      imageSize: Size.square(20),
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),
                if (alterationRequired)
                  Positioned(
                    bottom: 0,
                    left: 1,
                    right: 1,
                    child: Container(
                      height: 26.h,
                      decoration: BoxDecoration(
                        color: AppColors.orangePrimary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(9.r),
                          bottomRight: Radius.circular(9.r),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: AppText.poppinsSemiBold(
                        "Alteration needed",
                        fontSize: 10,
                        height: 22 / 10,
                      ),
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
                  name.replaceAll(RegExp(r'\s+'), ' ').trim(),
                  fontSize: 14,
                  height: 22 / 14,
                  color: AppColors.tealPrimary,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
                AppText.poppinsLight(
                  price == "" ? "Not Available" : price,
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
