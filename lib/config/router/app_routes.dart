import 'package:fitted/features/notifications/presentation/screens/notification_view.dart';
import 'package:fitted/features/products/presentation/screens/guest_product_view.dart';
import 'package:fitted/features/search/presentation/screens/search_results_view.dart';
import 'package:fitted/features/settings/presentation/screens/privacy_and_policy_view.dart';
import 'package:fitted/features/settings/presentation/screens/terms_and_conditions_view.dart';
import 'package:go_router/go_router.dart';
import 'package:fitted/features/measurement/presentation/screen/face_measurement_view.dart';
import 'package:fitted/features/measurement/presentation/screen/feet_measurement_view.dart';
import 'package:fitted/features/measurement/presentation/screen/hand_measurement_view.dart';
import 'package:fitted/features/measurement/presentation/screen/head_measurement_view.dart';
import 'package:fitted/features/search/presentation/screens/search_view.dart';
import 'package:fitted/config/helper/dialog/dialog_page.dart';
import 'package:fitted/config/helper/transitions/page_transition.dart';
import 'package:fitted/features/apparel/presentation/screens/apparel_detail_view.dart';
import 'package:fitted/features/auth/verify_otp/presentation/screens/otp_verification.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/forgot_password_view.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/password_reset_confirm_view.dart';
import 'package:fitted/features/auth/login/presentation/screens/login_view.dart';
import 'package:fitted/features/auth/forgot_password/presentation/screen/new_password_view.dart';
import 'package:fitted/features/main/presentation/main_view.dart';
import 'package:fitted/features/measurement/presentation/screen/face_measurement_form_view.dart';
import 'package:fitted/features/measurement/presentation/screen/feet_measurement_form_view.dart';
import 'package:fitted/features/measurement/presentation/screen/hand_measurement_form_view.dart';
import 'package:fitted/features/measurement/presentation/screen/head_measurement_form_view.dart';
import 'package:fitted/features/measurement/presentation/screen/size_preview_view.dart';
import 'package:fitted/features/onboarding/presentation/screens/onboarding_view.dart';
import 'package:fitted/features/auth/signup/presentation/screens/signup_view.dart';
import 'package:fitted/features/onboarding/presentation/screens/splash_view.dart';
import 'package:fitted/features/measurement/presentation/screen/user_info_view.dart';
import 'package:fitted/features/products/presentation/dialog/product_url_dialog.dart';
import 'package:fitted/features/products/presentation/screens/products_detail_view.dart';
import 'package:fitted/features/profile/presentation/screens/profile_view.dart';
import 'package:fitted/features/measurement/presentation/dialogs/confirmation_dialog.dart';
import 'package:fitted/features/settings/dialogs/delete_dialog.dart';
import 'package:fitted/features/settings/dialogs/log_out_dialog.dart';
import 'package:fitted/features/measurement/presentation/dialogs/update_other_measurements.dart';
import 'package:fitted/features/settings/presentation/screens/change_password_view.dart';
import 'package:fitted/features/profile/presentation/screens/personal_info_view.dart';
import 'package:fitted/features/settings/presentation/screens/settings_view.dart';

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
      builder: (context, state) => UserInfoView.fromState(state),
    ),
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
      path: AppRoutesEnum.productUrlDialog.path,
      name: AppRoutesEnum.productUrlDialog.name,
      pageBuilder: (context, state) => DialogPage(
        builder: (_) => ProductUrlDialog(),
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
      path: AppRoutesEnum.confirmationDialog.path,
      name: AppRoutesEnum.confirmationDialog.name,
      pageBuilder: (context, state) => DialogPage(
        builder: (_) => ConfirmationDialog(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.updateOtherMeasurements.path,
      name: AppRoutesEnum.updateOtherMeasurements.name,
      pageBuilder: (context, state) => DialogPage(
        builder: (_) => UpdateOtherMeasurements(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.sizePreview.path,
      name: AppRoutesEnum.sizePreview.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: SizePreviewView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.faceMeasurementFormView.path,
      name: AppRoutesEnum.faceMeasurementFormView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: FaceMeasurementFormView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.feetMeasurementFormView.path,
      name: AppRoutesEnum.feetMeasurementFormView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: FeetMeasurementFormView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.handMeasurementFormView.path,
      name: AppRoutesEnum.handMeasurementFormView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: HandMeasurementFormView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.headMeasurementFormView.path,
      name: AppRoutesEnum.headMeasurementFormView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: HeadMeasurementFormView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.faceMeasurementView.path,
      name: AppRoutesEnum.faceMeasurementView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: FaceMeasurementView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.feetMeasurementView.path,
      name: AppRoutesEnum.feetMeasurementView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: FeetMeasurementView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.handMeasurementView.path,
      name: AppRoutesEnum.handMeasurementView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: HandMeasurementView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.headMeasurementView.path,
      name: AppRoutesEnum.headMeasurementView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: HeadMeasurementView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.apparelDetailView.path,
      name: AppRoutesEnum.apparelDetailView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: ApparelDetailView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.productsDetailView.path,
      name: AppRoutesEnum.productsDetailView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: ProductsDetailView(
          productId: (state.extra as Map)['id'],
        ),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.searchView.path,
      name: AppRoutesEnum.searchView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: SearchView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.searchResultsView.path,
      name: AppRoutesEnum.searchResultsView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: SearchResultsView(),
      ),
    ),
    GoRoute(
      path: AppRoutesEnum.notificationView.path,
      name: AppRoutesEnum.notificationView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: NotificationView(),
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
    GoRoute(
      path: AppRoutesEnum.guestProductsDetailView.path,
      name: AppRoutesEnum.guestProductsDetailView.name,
      pageBuilder: (context, state) => buildTransitionPage(
        child: GuestProductsDetailView(
          productId: (state.extra as Map)['id'],
          userId: (state.extra as Map)['uid'],
        ),
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
  confirmationDialog,
  productUrlDialog,
  updateOtherMeasurements,
  feetMeasurementFormView,
  handMeasurementFormView,
  faceMeasurementFormView,
  headMeasurementFormView,
  feetMeasurementView,
  handMeasurementView,
  faceMeasurementView,
  headMeasurementView,
  apparelDetailView,
  productsDetailView,
  searchView,
  searchResultsView,
  notificationView,
  termsAndConditionsView,
  privacyAndPolicyView,
  guestProductsDetailView
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
      case AppRoutesEnum.productUrlDialog:
        return '/productUrlDialog';
      case AppRoutesEnum.logOutDialog:
        return '/logOutDialog';
      case AppRoutesEnum.updateOtherMeasurements:
        return '/updateOtherMeasurements';
      case AppRoutesEnum.confirmationDialog:
        return '/confirmationDialog';
      case AppRoutesEnum.sizePreview:
        return '/sizePreview';
      case AppRoutesEnum.faceMeasurementFormView:
        return '/faceMeasurementFormView';
      case AppRoutesEnum.feetMeasurementFormView:
        return '/feetMeasurementFormView';
      case AppRoutesEnum.headMeasurementFormView:
        return '/headMeasurementFormView';
      case AppRoutesEnum.handMeasurementFormView:
        return '/handMeasurementFormView';
      case AppRoutesEnum.faceMeasurementView:
        return '/faceMeasurementView';
      case AppRoutesEnum.feetMeasurementView:
        return '/feetMeasurementView';
      case AppRoutesEnum.headMeasurementView:
        return '/headMeasurementView';
      case AppRoutesEnum.handMeasurementView:
        return '/handMeasurementView';
      case AppRoutesEnum.apparelDetailView:
        return '/apparelDetailView';
      case AppRoutesEnum.productsDetailView:
        return '/productsDetailView';
      case AppRoutesEnum.searchView:
        return '/searchView';
      case AppRoutesEnum.searchResultsView:
        return '/searchResultsView';
      case AppRoutesEnum.notificationView:
        return '/NotificationView';
      case AppRoutesEnum.termsAndConditionsView:
        return '/termsAndConditionsView';
      case AppRoutesEnum.privacyAndPolicyView:
        return '/privacyAndPolicyView';
      case AppRoutesEnum.guestProductsDetailView:
        return '/guestProductsDetailView';
    }
  }

  String get name => toString().split('.').last;
}
