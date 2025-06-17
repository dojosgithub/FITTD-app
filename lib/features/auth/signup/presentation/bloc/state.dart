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
    required this.name,
    required this.confirmPassword,
    required this.isLoading,
    required this.isSuccess,
    required this.isOAuthSuccess,
    required this.isError,
    required this.seePassword,
    required this.seeConfirmPassword,
    required this.errorMessage,
  });

  factory SignInState.initial() {
    return SignInState(
      email: TextEditingController(),
      password: TextEditingController(),
      name: TextEditingController(),
      confirmPassword: TextEditingController(),
      isLoading: false,
      isSuccess: false,
      isOAuthSuccess: false,
      isError: false,
      seePassword: true,
      seeConfirmPassword: true,
      errorMessage: '',
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        name,
        confirmPassword,
        isLoading,
        isSuccess,
        isOAuthSuccess,
        isError,
        seePassword,
        seeConfirmPassword,
        errorMessage,
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
      name: name ?? this.name,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isOAuthSuccess: isOAuthSuccess ?? this.isOAuthSuccess,
      isError: isError ?? this.isError,
      seePassword: seePassword ?? this.seePassword,
      seeConfirmPassword: seeConfirmPassword ?? this.seeConfirmPassword,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
