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
  const AlterationSection({
    super.key,
    required this.attributeDifferences,
    required this.gender,
  });

  final AttributeDifferencesEntity attributeDifferences;
  final String gender;

  List<Widget> _buildAlterationItem({
    required String? value,
    required String? direction,
    required String label,
  }) {
    if (value != null && direction != null && value != "0.00") {
      return [
        SpacersVertical.spacer8,
        AlterationRecommendations(
          headline: "$label:",
          description: " $value inch $direction in ${label.toLowerCase()}",
        ),
      ];
    }
    return [];
  }

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
                "Alteration Recommended",
                fontSize: 16,
                height: 24 / 16,
                color: AppColors.charcoal,
              ),
              // FittedImageProvider.localSvg(
              //   imagePath: AppVectors.share,
              // ),
            ],
          ),
          ..._buildAlterationItem(
            value: attributeDifferences.bust,
            direction: attributeDifferences.bustDirection,
            label: gender == "female" ? "Bust" : "Chest",
          ),
          ..._buildAlterationItem(
            value: attributeDifferences.waist,
            direction: attributeDifferences.waistDirection,
            label: "Waist",
          ),
          ..._buildAlterationItem(
            value: attributeDifferences.sleeves,
            direction: attributeDifferences.sleevesDirection,
            label: "Sleeves",
          ),
          ..._buildAlterationItem(
            value: attributeDifferences.hip,
            direction: attributeDifferences.hipDirection,
            label: "Hip",
          ),
        ],
      ),
    );
  }
}
