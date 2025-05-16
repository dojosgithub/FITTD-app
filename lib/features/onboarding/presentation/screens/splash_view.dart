import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final userId = SharedPrefsStorage.getUserId();
    if (mounted) {
      if (userId != null && userId.isNotEmpty) {
        context.goNamed(AppRoutesEnum.main.name);
      } else {
        context.goNamed(AppRoutesEnum.login.name);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
              top: 148.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "logo",
                  transitionOnUserGestures: true,
                  child: FittedImageProvider.localAsset(
                    imagePath: AppImages.logo,
                    imageSize: Size(244.w, 72.h),
                    boxFit: BoxFit.cover,
                  ),
                ),
                SpacersVertical.spacer30,
                AppText.poppinsRegular(
                  "Let’s find something special!",
                  color: AppColors.tealPrimary,
                  fontSize: 20,
                  height: 24 / 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
