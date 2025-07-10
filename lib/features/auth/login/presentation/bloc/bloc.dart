import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/features/auth/login/domain/usecase/login_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/auth_utils.dart';
part 'event.dart';
part 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final OAuthUseCase oAuthUseCase;

  LoginBloc({required this.loginUseCase, required this.oAuthUseCase})
      : super(LoginState.initial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LoginRememberMeChanged>(_onLoginRememberMeChanged);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<ResetLoginState>((event, emit) => emit(LoginState.initial()));
  }
  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        isLoading: true, isError: false, errorMessage: '', isSuccess: false));
    final fcmToken = await AuthUtils.getFcmToken();

    final result = await loginUseCase(
      email: event.email ?? state.email.text,
      password: event.password ?? state.password.text,
      fcmToken: fcmToken,
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
          SharedPrefsStorage.setRefreshToken(
            event.password ?? state.password.text,
          );
          ToastUtil.showToast(
            message: "Account Not Verified. Verify Your Account To Continue.",
          );
        } else {
          emit(state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: failure.message.split(":").last,
          ));
          ToastUtil.showToast(
            message: failure.message.split(":").last,
          );
        }
      },
      (response) {
        AuthUtils.persistAuthData(
          accessToken: response.accessToken!,
          userId: response.user!.id!,
          fit: response.user!.measurements?['fit'],
        );

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

  Future<void> _onGoogleSignInRequested(
      GoogleSignInRequested event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        isLoading: true, isError: false, errorMessage: '', isSuccess: false));
    try {
      final googleSignIn = AuthUtils.getGoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final fcmToken = await AuthUtils.getFcmToken();
        final result = await oAuthUseCase.call(
          googleTokenId: googleAuth.idToken ?? "",
          fcmToken: fcmToken,
        );

        result.fold(
          (failure) {
            emit(state.copyWith(
              isLoading: false,
              isError: true,
              errorMessage: failure.message.split(":").last,
            ));

            ToastUtil.showToast(
              message: state.errorMessage,
            );
          },
          (response) {
            AuthUtils.persistAuthData(
              accessToken: response.accessToken!,
              userId: response.user!.id!,
              fit: response.user!.measurements?['fit'],
            );

            emit(
              state.copyWith(
                isLoading: false,
                isSuccess: true,
                hasMeasurements:
                    response.user?.measurements == null ? false : true,
              ),
            );
          },
        );
      }
    } catch (error) {
      AuthUtils.handleToast("Google Sign-In Failed");
    }
  }
}
