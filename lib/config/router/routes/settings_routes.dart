import 'package:go_router/go_router.dart';
import '../enum/app_routes_enum.dart';
import 'package:fitted/features/settings/presentation/screens/privacy_and_policy_view.dart';
import 'package:fitted/features/settings/presentation/screens/terms_and_conditions_view.dart';
import 'package:fitted/features/settings/presentation/screens/change_password_view.dart';
import 'package:fitted/features/settings/presentation/screens/settings_view.dart';
import 'package:fitted/config/helper/transitions/page_transition.dart';

final settingRoutes = [
  GoRoute(
    path: AppRoutesEnum.settings.path,
    name: AppRoutesEnum.settings.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: SettingsView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.changePasswordView.path,
    name: AppRoutesEnum.changePasswordView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: ChangePasswordView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.termsAndConditionsView.path,
    name: AppRoutesEnum.termsAndConditionsView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: TermsAndConditionsView(),
    ),
  ),
  GoRoute(
    path: AppRoutesEnum.privacyAndPolicyView.path,
    name: AppRoutesEnum.privacyAndPolicyView.name,
    pageBuilder: (context, state) => buildTransitionPage(
      child: PrivacyAndPolicyView(),
    ),
  ),
];
