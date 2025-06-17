import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/features/auth/forgot_password/domain/usecase/forgot_password_usecase.dart';
import 'package:fitted/features/auth/login/domain/usecase/login_usecase.dart';
import 'package:fitted/features/auth/verify_otp/data/enums/otp_enum.dart';

import '../../../../../config/storage/app_storage.dart';
import '../../domain/usecase/otp_usecase.dart';

part 'event.dart';
part 'state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final VerifyEmailOtpUseCase verifyEmailOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final ForgotPasswordUseCase forgotPasswordUsecase;
  final LoginUseCase loginUseCase;

  OtpBloc(
      {required this.verifyEmailOtpUseCase,
      required this.verifyOtpUseCase,
      required this.forgotPasswordUsecase,
      required this.loginUseCase})
      : super(const OtpState(
          otp: '',
          isLoading: false,
          isValid: false,
          errorMessage: null,
          isError: false,
          buttonDisabled: true,
        )) {
    on<OtpChangedEvent>(_onOtpChanged);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<ResendOtpEvent>(_onResendOtp);
  }

  void _onOtpChanged(OtpChangedEvent event, Emitter<OtpState> emit) {
    final isValid = event.otp.length != 6;
    emit(state.copyWith(otp: event.otp, buttonDisabled: isValid));
  }

  void _onVerifyOtp(VerifyOtpEvent event, Emitter<OtpState> emit) async {
    emit(state.copyWith(isLoading: true, isError: false, errorMessage: ''));

    final result = event.contextType == OtpContextType.signUp
        ? await verifyEmailOtpUseCase(code: state.otp, email: event.email)
        : await verifyOtpUseCase(code: state.otp, email: event.email);

    await result.fold(
      (failure) async {
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: failure.message,
        ));
        ToastUtil.showToast(message: failure.message);
      },
      (response) async {
        if (OtpContextType.resetPassword == event.contextType) {
          emit(state.copyWith(
            isLoading: false,
            isValid: true,
          ));
          return;
        }
        String fcmToken = '';
        await FirebaseMessaging.instance
            .getToken()
            .then((token) => fcmToken = token ?? "");
        final loginResult = await loginUseCase(
          password: SharedPrefsStorage.getRefreshToken().toString(),
          email: event.email,
          fcmToken: fcmToken,
        );

        await loginResult.fold(
          (failure) async {
            emit(state.copyWith(
              isLoading: false,
              isError: true,
              errorMessage: failure.message,
            ));
            ToastUtil.showToast(message: failure.message);
          },
          (response) async {
            await SharedPrefsStorage.setToken(response.accessToken!);
            await SharedPrefsStorage.setUserId(response.user!.id!);
            emit(state.copyWith(
              isLoading: false,
              isValid: true,
            ));
          },
        );
      },
    );
  }

  void _onResendOtp(ResendOtpEvent event, Emitter<OtpState> emit) async {
    switch (event.contextType) {
      case OtpContextType.signUp:
        String fcmToken = '';

        await FirebaseMessaging.instance
            .getToken()
            .then((token) => fcmToken = token ?? "");
        final loginResult = await loginUseCase(
          password: SharedPrefsStorage.getRefreshToken().toString(),
          email: event.email,
          fcmToken: fcmToken,
        );

        loginResult.fold(
          (failure) {},
          (success) => ToastUtil.showToast(message: "OTP Resend Sucessful"),
        );

        break;
      case OtpContextType.resetPassword:
        final result = await forgotPasswordUsecase(
          email: event.email,
        );
        result.fold(
          (failure) =>
              ToastUtil.showToast(message: failure.message.split(":").last),
          (success) => ToastUtil.showToast(message: "OTP Resend Sucessful"),
        );
        break;
      case OtpContextType.changeEmail:
        break;
    }
  }
}
