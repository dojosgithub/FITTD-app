part of 'bloc.dart';

class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];
}

class VerifyOtpEvent extends OtpEvent {}

class ResendOtpEvent extends OtpEvent {}

class OtpChangedEvent extends OtpEvent {
  final String otp;

  const OtpChangedEvent(this.otp);

  @override
  List<Object?> get props => [otp];
}
