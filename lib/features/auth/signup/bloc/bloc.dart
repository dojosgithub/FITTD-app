import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitted/features/auth/signup/domain/usecase/signup_usecase.dart';
import 'package:flutter/widgets.dart';

part 'event.dart';
part 'state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignUpUseCase signUpUseCase;

  // {required this.loginRepository}

  SignInBloc({required this.signUpUseCase})
      : super(SignInState(
          email: TextEditingController(),
          password: TextEditingController(),
          name: TextEditingController(),
          isLoading: false,
          isSuccess: false,
          isError: false,
          seeConfirmPassword: true,
          errorMessage: '',
          seePassword: true,
          confirmPassword: TextEditingController(),
        )) {
    on<SignInButtonPressed>(_onSignInButtonPressed);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    // on<LoginErrorOccurred>(_onLoginErrorOccurred);
    // on<LoginLoading>(_onLoginLoading);
    // on<LoginSuccess>(_onLoginSuccess);
  }
  Future<void> _onSignInButtonPressed(
      SignInButtonPressed event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isLoading: true, isError: false, errorMessage: ''));

    final result = await signUpUseCase(
      name: state.name.text,
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
        ));
      },
    );
  }

  void _onPasswordVisibilityChanged(
      PasswordVisibilityChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(
      seePassword: event.seePassword,
      seeConfirmPassword: event.seeConfirmPassword,
    ));
  }
}
