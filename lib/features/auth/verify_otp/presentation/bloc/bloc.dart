import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/features/auth/verify_otp/data/enums/otp_enum.dart';

import '../../domain/usecase/otp_usecase.dart';

part 'event.dart';
part 'state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final VerifyEmailOtpUseCase verifyEmailOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  OtpBloc({required this.verifyEmailOtpUseCase, required this.verifyOtpUseCase})
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
    final result = event.contextType == OtpContextType.signUp ||
            event.contextType == OtpContextType.login
        ? await verifyEmailOtpUseCase(
            code: state.otp,
            email: event.email,
          )
        : await verifyOtpUseCase(
            code: state.otp,
            email: event.email,
          );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: failure.message,
        ));
        ToastUtil.showToast(
          message: state.errorMessage!,
        );
      },
      (response) {
        emit(state.copyWith(
          isLoading: false,
          isValid: true,
        ));
      },
    );
  }

  void _onResendOtp(ResendOtpEvent event, Emitter<OtpState> emit) {
    // Handle OTP resend logic here
  }
}
