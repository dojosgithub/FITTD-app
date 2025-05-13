import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/features/auth/login/domain/usecase/login_usecase.dart';
import 'package:flutter/widgets.dart';

part 'event.dart';
part 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase})
      : super(LoginState(
          email: TextEditingController(),
          password: TextEditingController(),
          isLoading: false,
          isSuccess: false,
          isError: false,
          rememberMe: false,
          errorMessage: '',
          showVerfication: false,
          seePassword: true,
          hasMeasurements: false,
        )) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LoginRememberMeChanged>(_onLoginRememberMeChanged);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    // on<LoginErrorOccurred>(_onLoginErrorOccurred);
    // on<LoginLoading>(_onLoginLoading);
    // on<LoginSuccess>(_onLoginSuccess);
  }
  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        isLoading: true, isError: false, errorMessage: '', isSuccess: false));

    final result = await loginUseCase(
      email: event.email ?? state.email.text,
      password: event.password ?? state.password.text,
    );
    result.fold(
      (failure) {
        if (failure.message.contains("Account not verified")) {
          emit(state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: failure.message,
            showVerfication: true,
          ));
        } else {
          emit(state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: failure.message.split(":").last,
          ));
        }
      },
      (response) {
        SharedPrefsStorage.setToken(response.accessToken!);
        SharedPrefsStorage.setUserId(response.user!.id!);

        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          hasMeasurements: response.user?.measurements == null ? false : true,
        ));
      },
    );
  }

  void _onLoginRememberMeChanged(
      LoginRememberMeChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(rememberMe: event.rememberMe));
  }

  void _onPasswordVisibilityChanged(
      PasswordVisibilityChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(seePassword: event.seePassword));
  }
}
