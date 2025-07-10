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
