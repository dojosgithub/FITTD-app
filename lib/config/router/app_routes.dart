import 'package:fitted/config/helper/transitions/page_transition.dart';
import 'package:fitted/features/auth/verify_otp/presentation/screens/otp_verification.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/forgot_password_view.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/password_reset_confirm_view.dart';
import 'package:fitted/features/auth/login/presentation/screens/login_view.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/new_password_view.dart';
import 'package:fitted/features/home/presentation/home_view.dart';
import 'package:fitted/features/onboarding/presentation/onboarding_view.dart';
import 'package:fitted/features/auth/signup/presentation/screens/signup_view.dart';
import 'package:fitted/features/onboarding/presentation/splash_view.dart';
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
      path: '/confirm-otp',
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
      path: AppRoutesEnum.home.path,
      name: AppRoutesEnum.home.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: HomeView(),
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
  home,
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
      case AppRoutesEnum.home:
        return '/home';
    }
  }

  String get name => toString().split('.').last;
}
