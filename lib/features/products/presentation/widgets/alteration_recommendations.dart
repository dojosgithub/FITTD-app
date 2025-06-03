import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:flutter/material.dart';

class AlterationRecommendations extends StatelessWidget {
  const AlterationRecommendations({
    super.key,
    required this.headline,
    required this.description,
  });
  final String headline;
  final String description;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: headline,
            style: AppTextStyles.poppinsMedium(
              fontSize: 14,
              height: 22 / 14,
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: description,
            style: AppTextStyles.poppinsLight(
              fontSize: 14,
              height: 22 / 14,
              color: AppColors.charcoal.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
      maxLines: null,
      overflow: TextOverflow.visible,
    );
  }
}
