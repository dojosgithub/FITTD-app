part of 'bloc.dart';

class SignInState extends Equatable {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController name;
  final TextEditingController confirmPassword;
  final bool isLoading;
  final bool isSuccess;
  final bool isOAuthSuccess;
  final bool isError;
  final bool seePassword;
  final bool seeConfirmPassword;
  final String errorMessage;

  const SignInState({
    required this.email,
    required this.password,
    required this.isLoading,
    required this.isSuccess,
    required this.isOAuthSuccess,
    required this.isError,
    required this.seeConfirmPassword,
    required this.seePassword,
    required this.errorMessage,
    required this.name,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [
        email,
        password,
        isLoading,
        isSuccess,
        isError,
        errorMessage,
        seePassword,
        name,
        confirmPassword,
        seeConfirmPassword,
        isOAuthSuccess,
      ];

  SignInState copyWith({
    TextEditingController? email,
    TextEditingController? password,
    TextEditingController? name,
    TextEditingController? confirmPassword,
    bool? isLoading,
    bool? isSuccess,
    bool? isOAuthSuccess,
    bool? isError,
    bool? seePassword,
    bool? seeConfirmPassword,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isOAuthSuccess: isOAuthSuccess ?? this.isOAuthSuccess,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      name: name ?? this.name,
      seePassword: seePassword ?? this.seePassword,
      seeConfirmPassword: seeConfirmPassword ?? this.seeConfirmPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
