import 'package:fitted/config/colors/colors.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 0.65.sw,
          child: AppText.poppinsRegular(
            product.name,
            fontSize: 27,
            color: AppColors.tealPrimary,
            overflow: TextOverflow.clip,
          ),
        ),
        AppText.poppinsExtraBold(
          product.price,
          fontSize: 24,
          height: 32 / 24,
          color: AppColors.black,
        ),
      ],
    );
  }
}
