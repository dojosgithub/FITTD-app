import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildSearchSuggestions extends StatelessWidget {
  const BuildSearchSuggestions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 12,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 18.h,
      ),
      separatorBuilder: (context, index) => Divider(
        height: 24.h,
      ),
      itemBuilder: (context, index) => Row(
        spacing: 18.w,
        children: [
          FittedImageProvider.localSvg(
            imagePath: AppVectors.search,
            imageSize: Size(16.w, 16.h),
            boxFit: BoxFit.contain,
          ),
          Expanded(
            child: AppText.poppinsSemiBold(
              "Jeans Men",
              fontSize: 16,
              height: 24 / 16,
              color: AppColors.deepBurgundy,
            ),
          ),
          FittedImageProvider.localSvg(
            imagePath: AppVectors.chevronRight,
            imageSize: Size(16.w, 16.h),
            boxFit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
