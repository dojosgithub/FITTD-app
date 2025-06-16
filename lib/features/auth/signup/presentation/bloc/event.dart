part of 'bloc.dart';

class SignInEvent {
  const SignInEvent();
}

class SignInButtonPressed extends SignInEvent {
  const SignInButtonPressed();
}

class SignInRememberMeChanged extends SignInEvent {
  final bool rememberMe;

  const SignInRememberMeChanged({
    required this.rememberMe,
  });
}

class PasswordVisibilityChanged extends SignInEvent {
  final bool seePassword;
  final bool seeConfirmPassword;

  const PasswordVisibilityChanged({
    required this.seePassword,
    required this.seeConfirmPassword,
  });
}

class SignInErrorOccurred extends SignInEvent {
  final String errorMessage;

  const SignInErrorOccurred({
    required this.errorMessage,
  });
}

class GoogleSignInRequested extends SignInEvent {}
