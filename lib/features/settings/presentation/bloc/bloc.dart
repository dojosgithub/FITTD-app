import 'package:equatable/equatable.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/features/settings/domain/usecases/settings_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/change_password_request_model.dart';

part 'state.dart';
part 'event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ChangePasswordUseCase changePasswordUseCase;
  SettingsBloc({required this.changePasswordUseCase})
      : super(SettingsState(
          isLoading: false,
          isSucess: false,
          passwordController: TextEditingController(),
          newPasswordController: TextEditingController(),
          emailController: TextEditingController(),
          seePassword: true,
          seeConfirmPassword: true,
        )) {
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<ChangePassword>((event, emit) async {
      emit(state.copyWith(isLoading: true, isSucess: false));
      final response = await changePasswordUseCase(ChangePasswordRequestModel(
        email: state.emailController.text,
        password: state.newPasswordController.text,
        oldPassword: state.passwordController.text,
      ));

      response.fold((failure) {
        ToastUtil.showToast(message: failure.message);
        emit(state.copyWith(isLoading: false, isSucess: false));
      }, (sucess) {
        ToastUtil.showToast(message: "Password Change Sucessfull");
        state.emailController.clear();
        state.newPasswordController.clear();
        state.passwordController.clear();

        emit(state.copyWith(
          isLoading: false,
          isSucess: true,
          emailController: state.emailController,
          passwordController: state.passwordController,
          newPasswordController: state.newPasswordController,
        ));
      });
    });
  }
  void _onPasswordVisibilityChanged(
      PasswordVisibilityChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(
        seePassword: event.seePassword,
        seeConfirmPassword: event.seeConfirmPassword));
  }
}
