import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      transitionOnUserGestures: true,
      child: FittedImageProvider.localAsset(
        imagePath: AppImages.logo,
        imageSize: Size(244.w, 72.h),
        boxFit: BoxFit.cover,
      ),
    );
  }
}
