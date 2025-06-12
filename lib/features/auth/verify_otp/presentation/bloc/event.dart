// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class ResendOtpEvent extends OtpEvent {
  final String email;

  final OtpContextType contextType;
  const ResendOtpEvent({
    required this.email,
    required this.contextType,
  });
}

class OtpChangedEvent extends OtpEvent {
  final String otp;

  const OtpChangedEvent(this.otp);

  @override
  List<Object?> get props => [otp];
}
