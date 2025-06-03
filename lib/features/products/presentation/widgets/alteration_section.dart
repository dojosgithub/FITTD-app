import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/features/products/domain/entities/product_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/helper/image_provider/fitted_image_provider.dart';
import '../../../../config/helper/spacers/spacers.dart';
import '../../../../config/widgets/app_text.dart';
import 'alteration_recommendations.dart';

class AlterationSection extends StatelessWidget {
  const AlterationSection(
      {super.key, required this.attributeDifferences, required this.gender});

  final AttributeDifferencesEntity attributeDifferences;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.poppinsSemiBold(
                "Alternation Recommended",
                fontSize: 16,
                height: 24 / 16,
                color: AppColors.charcoal,
              ),
              FittedImageProvider.localSvg(
                imagePath: AppVectors.share,
              ),
            ],
          ),
          SpacersVertical.spacer8,
          if (attributeDifferences.bust != "0.00" &&
              attributeDifferences.bustDirection != null)
            AlterationRecommendations(
              headline: gender == "female" ? "Bust:" : "Chest:",
              description:
                  " ${attributeDifferences.bust} inch ${attributeDifferences.bustDirection} in ${gender == "female" ? "bust" : "chest"}",
            ),
          SpacersVertical.spacer8,
          if (attributeDifferences.waist != "0.00" &&
              attributeDifferences.waistDirection != null)
            AlterationRecommendations(
              headline: gender == "female" ? "Waist:" : "Chest:",
              description:
                  " ${attributeDifferences.waist} inch ${attributeDifferences.waistDirection} in waist",
            ),
          SpacersVertical.spacer8,
          if (attributeDifferences.sleeves != null &&
              attributeDifferences.sleevesDirection != null)
            AlterationRecommendations(
              headline: "Sleeves:",
              description:
                  " ${attributeDifferences.sleeves} inch ${attributeDifferences.sleevesDirection} in sleeves",
            ),
        ],
      ),
    );
  }
}
