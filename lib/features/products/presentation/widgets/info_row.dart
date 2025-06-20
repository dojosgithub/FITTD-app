import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/products/domain/entities/product_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final isFormattedSalePrice = RegExp(
      r'^Sale Price:\s*(from\s*)?\$?\d+(\.\d+)?\s*(-to|to)\s*\$?\d+(\.\d+)?',
      caseSensitive: false,
    ).hasMatch(product.price);

    final cleanedPrice = (() {
      var price = product.price;
      if (isFormattedSalePrice) {
        price = price
            .replaceFirst(
              RegExp(r'^Sale Price:\s*(from\s*)?', caseSensitive: false),
              '',
            )
            .replaceAll(
              RegExp(r'\s*(-)?to\s*', caseSensitive: false),
              ' - ',
            )
            .trim();
      }
      return price;
    })();

    return

        // isFormattedSalePrice
        //     ?
        Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.poppinsRegular(
          product.name,
          fontSize: 27,
          color: AppColors.tealPrimary,
          overflow: TextOverflow.clip,
        ),
        AppText.poppinsExtraBold(
          cleanedPrice,
          fontSize: 24,
          height: 32 / 24,
          color: AppColors.black,
          overflow: TextOverflow.clip,
        ),
        SpacersVertical.spacer4,
      ],
    );
    // : Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       SizedBox(
    //         width: 0.7.sw,
    //         child: AppText.poppinsRegular(
    //           product.name,
    //           fontSize: 27,
    //           color: AppColors.tealPrimary,
    //           overflow: TextOverflow.clip,
    //         ),
    //       ),
    //       AppText.poppinsExtraBold(
    //         cleanedPrice,
    //         fontSize: 24,
    //         height: 32 / 24,
    //         color: AppColors.black,
    //         overflow: TextOverflow.clip,
    //       ),
    //     ],
    //   );
  }
}
