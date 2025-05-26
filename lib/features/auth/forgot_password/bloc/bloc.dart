import 'package:equatable/equatable.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/features/auth/forgot_password/domain/usecase/forgot_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUsecase;
  final UpdatePasswordUseCase changePasswordUsecase;
  ForgotPasswordBloc({
    required this.forgotPasswordUsecase,
    required this.changePasswordUsecase,
  }) : super(
          ForgotPasswordState(
              isLoading: false,
              isEmailSucess: false,
              isResetSucess: false,
              isError: false,
              errorMessage: "",
              emailController: TextEditingController(),
              passwordController: TextEditingController(),
              confirmPasswordController: TextEditingController(),
              seeConfirmPassword: true,
              seePassword: true),
        ) {
    on<SendEmailEvent>(_handleEmailSend);
    on<ChangePasswordEvent>(_handlePasswordChange);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
  }

  _handleEmailSend(
    SendEmailEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      isError: false,
      errorMessage: "",
      isEmailSucess: false,
      isResetSucess: false,
    ));
    final result = await forgotPasswordUsecase(
      email: state.emailController.text,
    );
    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: failure.message,
        ));
        ToastUtil.showToast(message: failure.message.split(":").last);
      },
      (success) {
        emit(state.copyWith(
          isLoading: false,
          isEmailSucess: true,
        ));
      },
    );
  }

  _handlePasswordChange(
      ChangePasswordEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        isError: false,
        errorMessage: "",
        isEmailSucess: false,
        isResetSucess: false,
      ),
    );
    final result = await changePasswordUsecase(
      email: state.emailController.text,
      password: state.passwordController.text,
    );
    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: failure.message,
        ));

        ToastUtil.showToast(message: failure.message.split(":").last);
      },
      (success) {
        emit(state.copyWith(
          isLoading: false,
          isResetSucess: true,
        ));
      },
    );
  }

  void _onPasswordVisibilityChanged(
      PasswordVisibilityChanged event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(
        seePassword: event.seePassword,
        seeConfirmPassword: event.seeConfirmPassword));
  }
}
