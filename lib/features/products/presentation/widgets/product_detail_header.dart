import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class ProductDetailHeader extends StatelessWidget {
  const ProductDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedButton(
          // onTap: () => context.pushNamed(
          //   AppRoutesEnum.main.name,
          //   extra: {"index": 4},
          // ),
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
    );
  }
}
