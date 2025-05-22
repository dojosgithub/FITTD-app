part of 'bloc.dart';

class SettingsEvent {}

class PasswordVisibilityChanged extends SettingsEvent {
  final bool seePassword;
  final bool seeConfirmPassword;

  PasswordVisibilityChanged({
    required this.seePassword,
    required this.seeConfirmPassword,
  });
}

class ChangePassword extends SettingsEvent {}

class DeleteAccount extends SettingsEvent {}
