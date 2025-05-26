import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/features/main/data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApparelHeader extends StatelessWidget {
  const ApparelHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      children: [
        FittedImageProvider.circularNetwork(
          imagePath: HomeMockData.avatarImg,
          imageSize: Size(48.w, 48.h),
          boxFit: BoxFit.cover,
        ),
        AppText.poppinsMedium(
          "Hello Ashleigh",
          fontSize: 17,
          height: 22 / 17,
          color: AppColors.tealPrimary,
        ),
        Spacer(),
        RoundedButton(
          child: FittedImageProvider.localSvg(
            imagePath: AppVectors.notification,
            imageSize: Size(18.w, 17.h),
            boxFit: BoxFit.contain,
          ),
        ),
        RoundedButton(
          child: FittedImageProvider.localSvg(
            imagePath: AppVectors.wishlist,
            imageSize: Size(18.w, 17.h),
            boxFit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
