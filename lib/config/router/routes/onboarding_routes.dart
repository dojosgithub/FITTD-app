import 'package:fitted/features/onboarding/presentation/screens/onboarding_view.dart';
import 'package:fitted/features/onboarding/presentation/screens/splash_view.dart';
import 'package:go_router/go_router.dart';
import '../enum/app_routes_enum.dart';
import 'route_helpers.dart';
import 'package:fitted/config/helper/transitions/page_transition.dart';

final onboardingRoutes = [
  GoRoute(
    path: AppRoutesEnum.splash.path,
    name: AppRoutesEnum.splash.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: SplashView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.onboarding.path,
    name: AppRoutesEnum.onboarding.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: OnboardingView(),
    ),
  ),
];
