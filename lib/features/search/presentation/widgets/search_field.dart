import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return FittedInputField.withIcon(
      controller: controller,
      width: 1.sw,
      label: "",
      hint: "Search brand & products",
      hintStyle: AppTextStyles.poppinsRegular(
        fontSize: 16,
        height: 20 / 16,
        letterSpacing: 0.07 * 16,
        color: AppColors.deepBurgundy.withValues(
          alpha: 0.6,
        ),
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: FittedImageProvider.localSvg(
          imagePath: AppVectors.searchColored,
          imageSize: Size(8.w, 8.h),
          boxFit: BoxFit.contain,
        ),
      ),
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: GestureDetector(
          onTap: () {
            controller.clear();
          },
          child: FittedImageProvider.localSvg(
            imagePath: AppVectors.cross,
            imageSize: Size(8.w, 8.h),
            boxFit: BoxFit.contain,
          ),
        ),
      ),
      onChanged: (p0) => debugPrint("Search Query: $p0"),
    );
  }
}
