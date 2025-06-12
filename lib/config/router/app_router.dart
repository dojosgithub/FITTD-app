import 'package:fitted/config/router/app_routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutesEnum.splash.path,
    routes: [
      ...AppRoutes.routes,
    ],
  );
}
