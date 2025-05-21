import 'package:flutter/material.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/helper/spacers/spacers.dart';
import '../../../../config/widgets/app_text.dart';
import 'settings_card.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsCard> items;

  const SettingsSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.6,
          child: AppText.poppinsRegular(
            title,
            fontSize: 16,
            height: 24 / 16,
            color: AppColors.deepBurgundy,
          ),
        ),
        SpacersVertical.spacer18,
        ...items.expand((item) => [item, SpacersVertical.spacer18]).toList()
          ..removeLast(),
      ],
    );
  }
}
