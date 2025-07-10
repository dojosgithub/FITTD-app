import 'package:fitted/features/main/presentation/main_view.dart';
import 'package:go_router/go_router.dart';
import '../enum/app_routes_enum.dart';
import 'route_helpers.dart';
import 'package:fitted/config/helper/transitions/page_transition.dart';

final mainRoutes = [
  GoRoute(
    path: AppRoutesEnum.main.path,
    name: AppRoutesEnum.main.name,
    pageBuilder: (context, state) {
      final extra = state.extra;
      final extrasMap = extra is Map ? extra : {};

      return buildTransitionPage(
        child: MainView(
          index: (extrasMap['index'] ?? 0) as int,
          showDialog: (extrasMap['showDialog'] ?? false) as bool,
        ),
      );
    },
  ),
];
