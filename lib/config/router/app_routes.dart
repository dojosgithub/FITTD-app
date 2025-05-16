import 'package:fitted/config/helper/dialog/dialog_page.dart';
import 'package:fitted/config/helper/transitions/page_transition.dart';
import 'package:fitted/features/auth/verify_otp/presentation/screens/otp_verification.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/forgot_password_view.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/password_reset_confirm_view.dart';
import 'package:fitted/features/auth/login/presentation/screens/login_view.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/new_password_view.dart';
import 'package:fitted/features/main/presentation/main_view.dart';
import 'package:fitted/features/measurement/presentation/screen/size_preview_view.dart';
import 'package:fitted/features/onboarding/presentation/screens/onboarding_view.dart';
import 'package:fitted/features/auth/signup/presentation/screens/signup_view.dart';
import 'package:fitted/features/onboarding/presentation/screens/splash_view.dart';
import 'package:fitted/features/measurement/presentation/screen/user_info_view.dart';
import 'package:fitted/features/profile/presentation/screens/profile_view.dart';
import 'package:fitted/features/settings/dialogs/delete_dialog.dart';
import 'package:fitted/features/settings/dialogs/log_out_dialog.dart';
import 'package:fitted/features/settings/presentation/change_password_view.dart';
import 'package:fitted/features/settings/presentation/personal_info_view.dart';
import 'package:fitted/features/settings/presentation/settings_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final routes = [
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
    GoRoute(
      path: AppRoutesEnum.login.path,
      name: AppRoutesEnum.login.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: LoginView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.signup.path,
      name: AppRoutesEnum.signup.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: SignupView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.forgotPassword.path,
      name: AppRoutesEnum.forgotPassword.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: ForgotPasswordView(),
      ),
    ),
    GoRoute(
      name: AppRoutesEnum.confirmOtp.name,
      path: AppRoutesEnum.confirmOtp.path,
      builder: (context, state) => ConfirmOtpView.fromState(state),
    ),
    GoRoute(
      path: AppRoutesEnum.newPasswordView.path,
      name: AppRoutesEnum.newPasswordView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: NewPasswordView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.passwordResetConfirmView.path,
      name: AppRoutesEnum.passwordResetConfirmView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: PasswordResetConfirmView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.userInfoView.path,
      name: AppRoutesEnum.userInfoView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: UserInfoView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.main.path,
      name: AppRoutesEnum.main.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: MainView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.profile.path,
      name: AppRoutesEnum.profile.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: ProfileView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.settings.path,
      name: AppRoutesEnum.settings.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: SettingsView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.personalInfoView.path,
      name: AppRoutesEnum.personalInfoView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: PersonalInfoView(),
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
      path: AppRoutesEnum.deleteDialog.path,
      name: AppRoutesEnum.deleteDialog.name,
      pageBuilder: (context, state) => DialogPage(
        builder: (_) => DeleteAccountDialog(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.logOutDialog.path,
      name: AppRoutesEnum.logOutDialog.name,
      pageBuilder: (context, state) => DialogPage(
        builder: (_) => LogOutDialog(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.sizePreview.path,
      name: AppRoutesEnum.sizePreview.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: SizePreviewView(),
      ),
    ),
  ];
}

enum AppRoutesEnum {
  splash,
  onboarding,
  login,
  signup,
  forgotPassword,
  confirmOtp,
  newPasswordView,
  passwordResetConfirmView,
  userInfoView,
  main,
  profile,
  settings,
  personalInfoView,
  changePasswordView,
  sizePreview,
  deleteDialog,
  logOutDialog,
}

extension AppRoutesExtension on AppRoutesEnum {
  String get path {
    switch (this) {
      case AppRoutesEnum.splash:
        return '/splash';
      case AppRoutesEnum.onboarding:
        return '/onboarding';
      case AppRoutesEnum.login:
        return '/login';
      case AppRoutesEnum.signup:
        return '/signup';
      case AppRoutesEnum.forgotPassword:
        return '/forgotPassword';
      case AppRoutesEnum.confirmOtp:
        return '/confirmOtp';
      case AppRoutesEnum.newPasswordView:
        return '/newPasswordView';
      case AppRoutesEnum.passwordResetConfirmView:
        return '/passwordResetConfirmView';
      case AppRoutesEnum.userInfoView:
        return '/userInfoForms';
      case AppRoutesEnum.main:
        return '/home';
      case AppRoutesEnum.profile:
        return '/profile';
      case AppRoutesEnum.settings:
        return '/settings';
      case AppRoutesEnum.personalInfoView:
        return '/personalInfoView';
      case AppRoutesEnum.changePasswordView:
        return '/changePasswordView';
      case AppRoutesEnum.deleteDialog:
        return '/deleteDialog';
      case AppRoutesEnum.logOutDialog:
        return '/logOutDialog';
      case AppRoutesEnum.sizePreview:
        return '/sizePreview';
    }
  }

  String get name => toString().split('.').last;
}
