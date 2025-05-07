import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry alignment;
  final VoidCallback? onTap;
  final BoxDecoration? decoration;
  final String text;
  final TextStyle? textStyle;
  final Widget? child;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.alignment = Alignment.center,
    this.decoration,
    required this.text,
    this.textStyle,
    this.onTap,
    this.child, // Allow custom child widgets like Row for icon and text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 342.w,
        height: height ?? 60.h,
        decoration: decoration ??
            BoxDecoration(
              color: backgroundColor ?? AppColors.orangePrimary,
              borderRadius: borderRadius ?? BorderRadius.circular(100.r),
            ),
        alignment: alignment,
        child: child ??
            Text(
              text,
              style: textStyle ??
                  AppTextStyles.poppinsSemiBold(
                    fontSize: 16,
                    color: AppColors.white,
                    height: 24 / 16,
                  ),
            ),
      ),
    );
  }

  // Factory constructor for OutlineButton
  factory CustomButton.outline({
    required String text,
    VoidCallback? onTap,
    double? width,
    double? height,
    TextStyle? textStyle,
    Color? borderColor,
    double borderWidth = 2.0,
    BorderRadiusGeometry? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return CustomButton(
      width: width,
      height: height,
      onTap: onTap,
      text: text,
      textStyle: textStyle,
      borderRadius: borderRadius ?? BorderRadius.circular(100.r),
      alignment: alignment,
      backgroundColor: Colors.transparent,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? AppColors.orangePrimary,
          width: borderWidth,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(100.r),
      ),
    );
  }

  // Factory constructor for Icon and OutlineButton with Row (Icon + Text)
  factory CustomButton.iconAndOutline({
    required String text,
    required String icon,
    required Size iconSize,
    VoidCallback? onTap,
    double? width,
    double? height,
    TextStyle? textStyle,
    Color? borderColor,
    double borderWidth = 2.0,
    BorderRadiusGeometry? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return CustomButton(
      width: width,
      height: height,
      onTap: onTap,
      text: text,
      textStyle: textStyle,
      borderRadius: borderRadius ?? BorderRadius.circular(100.r),
      alignment: alignment,
      backgroundColor: Colors.transparent,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? AppColors.orangePrimary,
          width: borderWidth,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedImageProvider.localSvg(
            imagePath: icon,
            imageSize: iconSize,
          ), // The icon widget
          SizedBox(width: 8.w), // Optional spacing between icon and text
          Text(
            text,
            style: textStyle ??
                AppTextStyles.poppinsSemiBold(
                  fontSize: 16,
                  color: AppColors.orangePrimary, // Text color matches border
                  height: 24 / 16,
                ),
          ),
        ],
      ),
    );
  }
}
