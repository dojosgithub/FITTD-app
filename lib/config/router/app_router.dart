import 'package:fitted/config/helper/transitions/page_transition.dart';
import 'package:fitted/features/apparel/presentation/screens/apparel_detail_view.dart';
import 'package:fitted/features/notifications/presentation/screens/notification_view.dart';
import 'package:go_router/go_router.dart';
import 'enum/app_routes_enum.dart';
import 'routes/auth_routes.dart';
import 'routes/dialog_routes.dart';
import 'routes/main_routes.dart';
import 'routes/measurement_routes.dart';
import 'routes/onboarding_routes.dart';
import 'routes/product_routes.dart';
import 'routes/profile_routes.dart';
import 'routes/search_routes.dart';
import 'routes/settings_routes.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutesEnum.splash.path,
    routes: [
      GoRoute(
        path: AppRoutesEnum.apparelDetailView.path,
        name: AppRoutesEnum.apparelDetailView.name,
        pageBuilder: (context, state) => buildTransitionPage(
          child: ApparelDetailView(),
        ),
      ),
      GoRoute(
        path: AppRoutesEnum.notificationView.path,
        name: AppRoutesEnum.notificationView.name,
        pageBuilder: (context, state) => buildTransitionPage(
          child: NotificationView(),
        ),
      ),
      ...mainRoutes,
      ...authRoutes,
      ...dialogRoutes,
      ...measurementRoutes,
      ...onboardingRoutes,
      ...productRoutes,
      ...profileRoutes,
      ...searchRoutes,
      ...settingRoutes,
    ],
  );
}
