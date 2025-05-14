import 'package:fitted/config/providers/app_providers.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/config/theme/app_theme.dart';
import 'package:fitted/features/measurement/presentation/screen/size_recommendation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/service_locator.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await SharedPrefsStorage.init();
  await init();
  runApp(const MyApp());
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
        // child: MaterialApp.router(
        // debugShowCheckedModeBanner: false,
        // theme: AppThemeData.appTheme,
        //   routerConfig: AppRouter.router,
        // ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.appTheme,
          home: SizeRecommendationView(),
        ),
      ),
    );
  }
}
