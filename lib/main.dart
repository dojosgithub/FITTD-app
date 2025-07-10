import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitted/config/providers/app_providers.dart';
import 'package:fitted/config/router/app_router.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/config/theme/app_theme.dart';
import 'package:fitted/core/network/firebase/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/service_locator.dart';
import 'core/services/deep_links_service.dart';
import 'core/services/push_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await PushNotificationService().setupInteractedMessage();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await ScreenUtil.ensureScreenSize();
  await SharedPrefsStorage.init();
  await init();
  final deepLinkHandler = DeepLinkHandler();
  deepLinkHandler.handleInitialLink(_handleUri);
  deepLinkHandler.listenToLinks(_handleUri);
  runApp(const MyApp());
}

void _handleUri(Uri uri) {
  final productId = uri.queryParameters['productId'];
  final uid = uri.queryParameters['uid'];

  if (productId != null) {
    AppRouter.router.goNamed(
      AppRoutesEnum.guestProductsDetailView.name,
      extra: {
        "id": productId,
        "uid": uid,
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, _) => MultiBlocProvider(
        providers: [
          ...AppProviders.getProviders(),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.appTheme,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
