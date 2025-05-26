// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class ForgotPasswordState extends Equatable {
  final bool isLoading;
  final bool isEmailSucess;
  final bool isResetSucess;
  final bool isError;
  final String errorMessage;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool seePassword;
  final bool seeConfirmPassword;
  const ForgotPasswordState({
    required this.isLoading,
    required this.isEmailSucess,
    required this.isResetSucess,
    required this.isError,
    required this.seeConfirmPassword,
    required this.seePassword,
    required this.errorMessage,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isEmailSucess,
        isResetSucess,
        isError,
        errorMessage,
        emailController,
        passwordController,
        confirmPasswordController,
        seeConfirmPassword,
        seePassword
      ];

  ForgotPasswordState copyWith({
    bool? isLoading,
    bool? isResetSucess,
    bool? isEmailSucess,
    bool? isError,
    bool? seeConfirmPassword,
    bool? seePassword,
    String? errorMessage,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      isEmailSucess: isEmailSucess ?? this.isEmailSucess,
      isResetSucess: isResetSucess ?? this.isResetSucess,
      isError: isError ?? this.isError,
      seeConfirmPassword: seeConfirmPassword ?? this.seeConfirmPassword,
      seePassword: seePassword ?? this.seePassword,
      errorMessage: errorMessage ?? this.errorMessage,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
    );
  }
}
