import 'package:fitted/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionSeparator extends StatelessWidget {
  final double spacingBefore;
  final double spacingAfter;

  const SectionSeparator({
    super.key,
    this.spacingBefore = 20,
    this.spacingAfter = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacingBefore.h),
        Divider(
          color: AppColors.deepBurgundy.withValues(alpha: 0.14),
        ),
        SizedBox(height: spacingAfter.h),
      ],
    );
  }
}
