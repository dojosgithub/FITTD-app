import 'package:equatable/equatable.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/features/auth/forgot_password/domain/usecase/forgot_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUsecase forgotPasswordUsecase;
  ForgotPasswordBloc({
    required this.forgotPasswordUsecase,
  }) : super(
          ForgotPasswordState(
            isLoading: false,
            isSucess: false,
            isError: false,
            errorMessage: "",
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            confirmPasswordController: TextEditingController(),
          ),
        ) {
    on<ForgotPasswordSendEmailEvent>(_handleEmailSend);
  }

  _handleEmailSend(
    ForgotPasswordSendEmailEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isError: false, errorMessage: ""));
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
          isSucess: true,
        ));
      },
    );
  }
}
