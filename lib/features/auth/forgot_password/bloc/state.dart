// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class ForgotPasswordState extends Equatable {
  final bool isLoading;
  final bool isSucess;
  final bool isError;
  final String errorMessage;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  const ForgotPasswordState({
    required this.isLoading,
    required this.isSucess,
    required this.isError,
    required this.errorMessage,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  List<Object?> get props => [
        isLoading,
        isSucess,
        isError,
        errorMessage,
        emailController,
        passwordController,
        confirmPasswordController
      ];

  ForgotPasswordState copyWith({
    bool? isLoading,
    bool? isSucess,
    bool? isError,
    String? errorMessage,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      isSucess: isSucess ?? this.isSucess,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
    );
  }
}
