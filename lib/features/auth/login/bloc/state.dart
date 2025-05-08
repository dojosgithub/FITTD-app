part of 'bloc.dart';

class LoginState extends Equatable {
  final TextEditingController email;
  final TextEditingController password;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final bool showVerfication;
  final bool rememberMe;
  final bool seePassword;
  final String errorMessage;

  const LoginState({
    required this.email,
    required this.password,
    required this.isLoading,
    required this.isSuccess,
    required this.isError,
    required this.showVerfication,
    required this.rememberMe,
    required this.seePassword,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [
        email,
        password,
        isLoading,
        isSuccess,
        isError,
        showVerfication,
        errorMessage,
        seePassword,
        rememberMe
      ];

  LoginState copyWith({
    TextEditingController? email,
    TextEditingController? password,
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    bool? showVerfication,
    bool? seePassword,
    bool? rememberMe,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      rememberMe: rememberMe ?? this.rememberMe,
      seePassword: seePassword ?? this.seePassword,
      showVerfication: showVerfication ?? this.showVerfication,
    );
  }
}
