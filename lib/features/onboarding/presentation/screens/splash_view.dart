import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/storage/app_storage.dart';
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
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await FirebaseMessaging.instance.getAPNSToken();

    await Future.delayed(const Duration(seconds: 2));

    final userId = SharedPrefsStorage.getUserId();
    if (mounted) {
      if (userId != null && userId.isNotEmpty) {
        context.goNamed(AppRoutesEnum.main.name);
      } else {
        context.goNamed(AppRoutesEnum.onboarding.name);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "logo",
          transitionOnUserGestures: true,
          child: FittedImageProvider.localAsset(
            imagePath: AppImages.logo,
            imageSize: Size(244.w, 72.h),
            boxFit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
