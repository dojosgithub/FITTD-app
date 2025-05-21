import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../assets/icons.dart';
import '../../colors/colors.dart';
import '../../widgets/app_text.dart';
import '../image_provider/fitted_image_provider.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet({
    super.key,
    required this.onCamera,
    required this.onGallery,
  });

  final Function()? onCamera;
  final Function()? onGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 28.h,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ImagePickerSheetCard(
            onTap: onCamera,
            title: "Camera",
            icon: AppVectors.camera,
          ),
          ImagePickerSheetCard(
            onTap: onGallery,
            title: "Gallery",
            icon: AppVectors.gallery,
          ),
        ],
      ),
    );
  }
}

class ImagePickerSheetCard extends StatelessWidget {
  const ImagePickerSheetCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final String icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 28.h,
        ),
        width: 158.w,
        height: 180.h,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey,
                offset: Offset(3, 3),
                blurRadius: 6,
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            FittedImageProvider.localSvg(
              imagePath: icon,
              imageSize: Size(91.w, 91.h),
              boxFit: BoxFit.cover,
            ),
            AppText.poppinsSemiBold(
              title,
              fontSize: 12,
              height: 18 / 12,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
