// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'bloc.dart';

class SettingsState extends Equatable {
  final bool isLoading;
  final bool isSucess;
  final bool seePassword;
  final bool seeConfirmPassword;

  final TextEditingController passwordController;
  final TextEditingController newPasswordController;
  final TextEditingController deleteAccountController;
  final bool deleteAccountSucess;
  const SettingsState({
    required this.isLoading,
    required this.isSucess,
    required this.seePassword,
    required this.seeConfirmPassword,
    required this.passwordController,
    required this.newPasswordController,
    required this.deleteAccountController,
    required this.deleteAccountSucess,
  });

  SettingsState copyWith({
    bool? isLoading,
    bool? isSucess,
    bool? seePassword,
    bool? seeConfirmPassword,
    TextEditingController? passwordController,
    TextEditingController? newPasswordController,
    TextEditingController? deleteAccountController,
    bool? deleteAccountSucess,
  }) {
    return SettingsState(
      isLoading: isLoading ?? this.isLoading,
      isSucess: isSucess ?? this.isSucess,
      seePassword: seePassword ?? this.seePassword,
      seeConfirmPassword: seeConfirmPassword ?? this.seeConfirmPassword,
      passwordController: passwordController ?? this.passwordController,
      newPasswordController:
          newPasswordController ?? this.newPasswordController,
      deleteAccountController:
          deleteAccountController ?? this.deleteAccountController,
      deleteAccountSucess: deleteAccountSucess ?? this.deleteAccountSucess,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isSucess,
        passwordController,
        newPasswordController,
        seePassword,
        seeConfirmPassword,
        deleteAccountController,
        deleteAccountSucess
      ];
}
