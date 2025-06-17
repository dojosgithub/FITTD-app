part of 'bloc.dart';

class LoginEvent {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String? email;
  final String? password;

  LoginButtonPressed({this.email, this.password});
}

class LoginRememberMeChanged extends LoginEvent {
  final bool rememberMe;

  const LoginRememberMeChanged({
    required this.rememberMe,
  });
}

class PasswordVisibilityChanged extends LoginEvent {
  final bool seePassword;

  const PasswordVisibilityChanged({
    required this.seePassword,
  });
}

class LoginErrorOccurred extends LoginEvent {
  final String errorMessage;

  const LoginErrorOccurred({
    required this.errorMessage,
  });
}

class GoogleSignInRequested extends LoginEvent {}

class ResetLoginState extends LoginEvent {}
