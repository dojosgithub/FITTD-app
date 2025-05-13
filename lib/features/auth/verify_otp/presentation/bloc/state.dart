// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc.dart';

class OtpState extends Equatable {
  final String otp;
  final bool isLoading;
  final bool isValid;
  final bool isError;
  final String? errorMessage;
  final bool buttonDisabled;

  const OtpState({
    required this.otp,
    required this.isLoading,
    required this.isValid,
    required this.errorMessage,
    required this.isError,
    required this.buttonDisabled,
  });

  @override
  List<Object?> get props => [
        otp,
        isLoading,
        isValid,
        isError,
        errorMessage,
        buttonDisabled,
      ];

  OtpState copyWith({
    String? otp,
    bool? isLoading,
    bool? isValid,
    bool? isError,
    String? errorMessage,
    bool? buttonDisabled,
  }) {
    return OtpState(
      otp: otp ?? this.otp,
      isLoading: isLoading ?? this.isLoading,
      isValid: isValid ?? this.isValid,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      buttonDisabled: buttonDisabled ?? this.buttonDisabled,
    );
  }
}
