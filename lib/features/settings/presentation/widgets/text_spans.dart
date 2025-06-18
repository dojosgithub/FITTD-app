import 'package:flutter/material.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/app_text.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/colors.dart';

class PrivacyTextColumn extends StatelessWidget {
  const PrivacyTextColumn({
    super.key,
    required this.heading,
    required this.desc,
    this.isBold = false,
  });

  final String heading;
  final String desc;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.h,
      children: [
        AppText.poppinsMedium(
          heading,
          fontSize: 14,
          height: 22 / 14,
          letterSpacing: -.02 * 14,
          color: AppColors.black,
        ),
        (isBold ? AppText.poppinsMedium : AppText.poppinsRegular)(
          desc,
          fontSize: 14,
          height: 22 / 14,
          letterSpacing: -.02 * 14,
          color: AppColors.black.withValues(
            alpha: isBold ? 1 : 0.6,
          ),
        ),
      ],
    );
  }
}

class PrivacyTextSpan extends StatelessWidget {
  const PrivacyTextSpan({
    super.key,
    required this.heading,
    required this.desc,
  });

  final String heading;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: heading,
            style: AppTextStyles.poppinsMedium(
              fontSize: 14,
              height: 22 / 14,
              letterSpacing: -.02 * 14,
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: desc,
            style: AppTextStyles.poppinsRegular(
              fontSize: 14,
              height: 22 / 14,
              letterSpacing: -.02 * 14,
              color: AppColors.black.withValues(alpha: 0.6),
            ),
          )
        ],
      ),
    );
  }
}
