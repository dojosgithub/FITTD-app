import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/products/domain/entities/product_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (product.rating != null)
          FittedImageProvider.localSvg(
              imagePath: AppVectors.star,
              imageSize: Size(16.w, 16.h),
              boxFit: BoxFit.contain),
        Spacers.spacer10,
        AppText.poppinsRegular(
          "${product.rating ?? ""} ${product.reviewCount == null ? "" : "(${product.reviewCount} Reviews)"}",
          fontSize: 17,
          height: 22 / 17,
          color: AppColors.tealSecondary,
        ),
      ],
    );
  }
}
