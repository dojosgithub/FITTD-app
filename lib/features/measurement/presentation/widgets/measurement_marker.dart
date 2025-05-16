import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeasurementMarker extends StatelessWidget {
  const MeasurementMarker({
    super.key,
    required this.part,
    required this.value,
    this.height,
    this.width,
    this.hasTop = false,
    this.hasbottom = true,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String part;
  final String value;
  final bool hasTop;
  final bool hasbottom;
  final double? height;
  final double? width;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w ?? 79.w,
      height: height?.h ?? 45.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: hasbottom
              ? BorderSide(
                  color: AppColors.black,
                  width: 0.7,
                )
              : BorderSide(
                  color: AppColors.white,
                  width: 0,
                ),
          top: hasTop
              ? BorderSide(
                  color: AppColors.black,
                  width: 0.7,
                )
              : BorderSide(
                  color: AppColors.white,
                  width: 0,
                ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Opacity(
            opacity: 0.8,
            child: AppText.poppinsSemiBold(
              value,
              fontSize: 14,
              height: 22 / 14,
              color: AppColors.charcoal,
            ),
          ),
          Opacity(
            opacity: 0.6,
            child: AppText.poppinsRegular(
              part,
              fontSize: 11,
              height: 18 / 11,
              letterSpacing: -.03 * 12,
              color: AppColors.charcoal,
            ),
          )
        ],
      ),
    );
  }
}
