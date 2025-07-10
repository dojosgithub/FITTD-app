import 'package:fitted/features/auth/forgot_password/presentation/screen/forgot_password_view.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/new_password_view.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/password_reset_confirm_view.dart';
import 'package:fitted/features/auth/login/presentation/screens/login_view.dart';
import 'package:fitted/features/auth/signup/presentation/screens/signup_view.dart';
import 'package:fitted/features/auth/verify_otp/presentation/screens/otp_verification.dart';
import 'package:go_router/go_router.dart';
import '../enum/app_routes_enum.dart';
import 'route_helpers.dart';
import 'package:fitted/config/helper/transitions/page_transition.dart';

final authRoutes = [
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
];
