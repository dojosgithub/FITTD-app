import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event.dart';
part 'state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc()
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
    final isValid = event.otp.length == 6;
    emit(state.copyWith(otp: event.otp, isValid: isValid));
  }

  void _onVerifyOtp(VerifyOtpEvent event, Emitter<OtpState> emit) {
    // Handle OTP verification logic here
  }

  void _onResendOtp(ResendOtpEvent event, Emitter<OtpState> emit) {
    // Handle OTP resend logic here
  }
}
