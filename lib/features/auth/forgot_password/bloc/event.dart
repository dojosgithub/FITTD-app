part of 'bloc.dart';

class ForgotPasswordEvent {}

class SendEmailEvent extends ForgotPasswordEvent {}

class ChangePasswordEvent extends ForgotPasswordEvent {}
