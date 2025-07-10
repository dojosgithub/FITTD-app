import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';

import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BackToLoginWidget extends StatelessWidget {
  const BackToLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushReplacementNamed(
        AppRoutesEnum.login.name,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8.w,
        children: [
          FittedImageProvider.localSvg(
            imagePath: AppVectors.backArrow,
          ),
          AppText.poppinsSemiBold(
            "Back to log in",
            fontSize: 14,
            height: 20 / 14,
            color: AppColors.tealSecondary,
          ),
        ],
      ),
    );
  }
}
