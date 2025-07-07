import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailHeader extends StatelessWidget {
  const ProductDetailHeader({super.key, required this.id, required this.name});
  final String id;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedButton(
          onTap: () {
            final goRouter = GoRouter.of(context);
            final matches =
                goRouter.routerDelegate.currentConfiguration.matches;
            for (int i = matches.length - 1; i >= 0; i--) {
              final match = matches[i];
              if (match.matchedLocation != '/productsDetailView') {
                final backSteps = matches.length - 1 - i;
                for (int j = 0; j < backSteps; j++) {
                  goRouter.pop();
                }
                break;
              }
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: FittedImageProvider.localSvg(
              imagePath: AppVectors.backArrow2,
              imageSize: Size(13.w, 17.h),
              boxFit: BoxFit.contain,
            ),
          ),
        ),
        RoundedButton(
          onTap: () {
            SharePlus.instance.share(
              ShareParams(
                title: name,
                uri: Uri.parse(
                    "https://abdulla-khan.github.io/redirect.html?productId=$id&uid=${SharedPrefsStorage.getUserId()}"),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: FittedImageProvider.localSvg(
              imagePath: AppVectors.share,
              imageSize: Size(13.w, 17.h),
              boxFit: BoxFit.contain,
              colorFilter:
                  ColorFilter.mode(AppColors.tealSecondary, BlendMode.srcIn),
            ),
          ),
        ),
      ],
    );
  }
}
