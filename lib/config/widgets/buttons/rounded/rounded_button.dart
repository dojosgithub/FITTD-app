import 'package:fitted/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 48.w,
        height: 48.h,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.grey,
            width: 0.1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(
                alpha: 0.04,
              ),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: child);
  }
}
