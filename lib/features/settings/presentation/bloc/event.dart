// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class ChangePassword extends SettingsEvent {
  final String email;
  ChangePassword({
    required this.email,
  });
}

class DeleteAccount extends SettingsEvent {}
