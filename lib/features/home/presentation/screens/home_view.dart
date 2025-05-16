import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/features/main/data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 16.0, left: 12, right: 12),
        child: Column(
          children: [
            Row(
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
                  onTap: () {
                    SharedPrefsStorage.removeToken();
                    SharedPrefsStorage.removeUserId();
                  },
                  child: FittedImageProvider.localSvg(
                    imagePath: AppVectors.notification,
                    imageSize: Size(18.w, 17.h),
                    boxFit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            FittedInputField.withIcon(
              hint: "Search for...",
              label: "",
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                  child: FittedImageProvider.localSvg(
                    imagePath: AppVectors.filter,
                    imageSize: Size(18.w, 17.h),
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: FittedImageProvider.localSvg(
                  imagePath: AppVectors.search,
                  imageSize: Size(12.w, 12.h),
                  boxFit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
