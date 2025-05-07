import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
          isVerified: false,
          seePassword: true,
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
    emit(state.copyWith(isLoading: true, isError: false, errorMessage: ''));

    final result = await loginUseCase(
      email: state.email.text,
      password: state.password.text,
    );
    result.fold(
      (failure) {
        log('result: ${failure.message}');

        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: failure.message,
        ));
      },
      (response) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          isVerified: response.isVerified,
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
