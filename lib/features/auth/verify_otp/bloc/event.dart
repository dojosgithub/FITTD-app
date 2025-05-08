part of 'bloc.dart';

class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];
}

class VerifyOtpEvent extends OtpEvent {
  final OtpContextType contextType;
  final String email;
  const VerifyOtpEvent({
    required this.contextType,
    required this.email,
  });
}

class ResendOtpEvent extends OtpEvent {}

class OtpChangedEvent extends OtpEvent {
  final String otp;

  const OtpChangedEvent(this.otp);

  @override
  List<Object?> get props => [otp];
}
