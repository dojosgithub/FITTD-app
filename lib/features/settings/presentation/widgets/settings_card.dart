import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      this.onTap});

  final String title;
  final String subtitle;
  final String icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.w,
        children: [
          FittedImageProvider.localSvg(
            imagePath: icon,
            imageSize: Size(24.w, 24.h),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.h,
            children: [
              AppText.poppinsMedium(
                title,
                fontSize: 16,
                height: 24 / 16,
                color: AppColors.deepBurgundy,
              ),
              Opacity(
                opacity: 0.6,
                child: AppText.poppinsLight(
                  subtitle,
                  fontSize: 12,
                  height: 18 / 12,
                  color: AppColors.deepBurgundy,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
