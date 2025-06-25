import 'package:equatable/equatable.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/features/settings/data/models/delete_account_request_model.dart';
import 'package:fitted/features/settings/domain/usecases/settings_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/change_password_request_model.dart';

part 'state.dart';
part 'event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ChangePasswordUseCase changePasswordUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;
  SettingsBloc(
      {required this.changePasswordUseCase, required this.deleteAccountUseCase})
      : super(SettingsState(
          isLoading: false,
          isSucess: false,
          passwordController: TextEditingController(),
          deleteAccountSucess: false,
          deleteAccountController: TextEditingController(),
          newPasswordController: TextEditingController(),
          seePassword: true,
          seeConfirmPassword: true,
        )) {
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<ChangePassword>((event, emit) async {
      emit(state.copyWith(isLoading: true, isSucess: false));
      final response = await changePasswordUseCase(ChangePasswordRequestModel(
        email: event.email,
        password: state.newPasswordController.text,
        oldPassword: state.passwordController.text,
      ));

      response.fold((failure) {
        ToastUtil.showToast(message: failure.message);
        emit(state.copyWith(isLoading: false, isSucess: false));
      }, (sucess) {
        ToastUtil.showToast(message: "Password Change Sucessfull");

        state.newPasswordController.clear();
        state.passwordController.clear();

        emit(state.copyWith(
          isLoading: false,
          isSucess: true,
          seePassword: true,
          passwordController: state.passwordController,
          newPasswordController: state.newPasswordController,
        ));
      });
    });
    on<DeleteAccount>((event, emit) async {
      emit(state.copyWith(isLoading: true, deleteAccountSucess: false));
      final response = await deleteAccountUseCase(DeleteAccountRequestModel(
        password: state.deleteAccountController.text,
      ));

      response.fold((failure) {
        ToastUtil.showToast(message: failure.message);
        emit(state.copyWith(isLoading: false, deleteAccountSucess: false));
      }, (sucess) {
        ToastUtil.showToast(message: "Account Deletion Sucessfull");
        state.deleteAccountController.clear();
        SharedPrefsStorage.clearUserDetails();
        emit(state.copyWith(
          isLoading: false,
          seePassword: true,
          deleteAccountSucess: true,
          deleteAccountController: state.deleteAccountController,
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
