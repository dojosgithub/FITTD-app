part of 'bloc.dart';

class ForgotPasswordEvent {}

class SendEmailEvent extends ForgotPasswordEvent {}

class ChangePasswordEvent extends ForgotPasswordEvent {}

class PasswordVisibilityChanged extends ForgotPasswordEvent {
  final bool seePassword;
  final bool seeConfirmPassword;

  PasswordVisibilityChanged({
    required this.seePassword,
    required this.seeConfirmPassword,
  });
}
