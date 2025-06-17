import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/features/auth/login/domain/usecase/login_usecase.dart';
import 'package:fitted/features/auth/signup/domain/usecase/signup_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'event.dart';
part 'state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignUpUseCase signUpUseCase;
  final OAuthUseCase oAuthUseCase;

  SignInBloc({required this.signUpUseCase, required this.oAuthUseCase})
      : super(SignInState.initial()) {
    on<SignInButtonPressed>(_onSignInButtonPressed);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<ResetSignInState>((event, emit) => emit(SignInState.initial()));
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
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: failure.message,
        ));
        ToastUtil.showToast(
          message: state.errorMessage,
        );
      },
      (response) {
        SharedPrefsStorage.setRefreshToken(state.password.text);
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

  Future<void> _onGoogleSignInRequested(
      GoogleSignInRequested event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        isError: false,
        errorMessage: '',
        isOAuthSuccess: false));
    try {
      final GoogleSignIn googleSignIn = Platform.isAndroid
          ? GoogleSignIn(
              clientId:
                  "582529657919-kb8675mbd6930u4oamgd9iolplmhedko.apps.googleusercontent.com")
          : GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        log(googleAuth.idToken ?? "NOTHING");
        String fcmToken = '';
        await FirebaseMessaging.instance
            .getToken()
            .then((token) => fcmToken = token ?? "");
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
            SharedPrefsStorage.setToken(response.accessToken!);
            SharedPrefsStorage.setUserId(response.user!.id!);
            response.user!.measurements == null
                ? null
                : SharedPrefsStorage.setUserFit(
                    response.user!.measurements['fit']);
            response.user!.measurements == null
                ? emit(
                    state.copyWith(
                      isLoading: false,
                      isSuccess: false,
                      isOAuthSuccess: true,
                    ),
                  )
                : emit(
                    state.copyWith(
                      isLoading: false,
                      isOAuthSuccess: true,
                      isSuccess: true,
                    ),
                  );
          },
        );
      }
    } catch (error) {
      log("Google Sign-In Error: $error");
      ToastUtil.showToast(message: "Google Sign-In Failed");
    }
  }
}
