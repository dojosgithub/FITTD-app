import 'package:fitted/features/profile/presentation/screens/profile_view.dart';
import 'package:fitted/features/profile/presentation/screens/personal_info_view.dart';
import 'package:go_router/go_router.dart';
import '../enum/app_routes_enum.dart';
import 'route_helpers.dart';
import 'package:fitted/config/helper/transitions/page_transition.dart';

final profileRoutes = [
  GoRoute(
    path: AppRoutesEnum.profile.path,
    name: AppRoutesEnum.profile.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: ProfileView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.personalInfoView.path,
    name: AppRoutesEnum.personalInfoView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: PersonalInfoView(),
    ),
  ),
];
