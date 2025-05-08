import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/auth/verify_otp/bloc/bloc.dart';
import 'package:fitted/features/auth/widgets/back_to_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../data/enums/otp_enum.dart';

class ConfirmOtpView extends StatelessWidget {
  final String email;
  final OtpContextType contextType;

  const ConfirmOtpView({
    super.key,
    required this.email,
    required this.contextType,
  });

  static OtpContextType _getContextTypeFromString(String value) {
    return OtpContextType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => OtpContextType.signUp,
    );
  }

  factory ConfirmOtpView.fromState(GoRouterState state) {
    final email = state.uri.queryParameters['email'] ?? '';
    final contextTypeString = state.uri.queryParameters['context'] ?? '';
    final contextType = _getContextTypeFromString(contextTypeString);

    return ConfirmOtpView(email: email, contextType: contextType);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 96.w),
        child: Center(
          child: SizedBox(
            width: 342.w,
            child: Column(
              children: [
                FittedImageProvider.localSvg(
                  imagePath: AppVectors.mail,
                ),
                SpacersVertical.spacer20,
                AppText.poppinsSemiBold(
                  "Check your email",
                  fontSize: 24,
                  height: 32 / 24,
                  color: AppColors.tealPrimary,
                ),
                SpacersVertical.spacer6,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.poppinsRegular(
                      "We sent an OTP to ",
                      fontSize: 16,
                      height: 24 / 16,
                      color: AppColors.tealSecondary,
                      textAlign: TextAlign.center,
                    ),
                    AppText.poppinsMedium(
                      email,
                      fontSize: 16,
                      height: 24 / 16,
                      color: AppColors.tealPrimary,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SpacersVertical.spacer32,
                BlocConsumer<OtpBloc, OtpState>(
                  listener: (context, state) {
                    if (state.isValid) {
                      switch (contextType) {
                        case OtpContextType.signUp:
                          context.pushReplacementNamed(AppRoutesEnum.home.name);
                          break;
                        case OtpContextType.resetPassword:
                          context.pushReplacementNamed(
                              AppRoutesEnum.newPasswordView.name);

                          break;
                        case OtpContextType.changeEmail:
                          break;
                      }
                    }
                  },
                  builder: (context, state) => Column(
                    children: [
                      Pinput(
                        onChanged: (value) {
                          context.read<OtpBloc>().add(
                                OtpChangedEvent(
                                  value,
                                ),
                              );
                        },
                        length: 6,
                        separatorBuilder: (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 1,
                        ),
                        defaultPinTheme: PinTheme(
                          width: 48,
                          height: 48,
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1, color: AppColors.grey),
                          ),
                        ),
                      ),
                      SpacersVertical.spacer34,
                      state.isLoading
                          ? LoadingIndicator()
                          : Column(
                              children: [
                                Opacity(
                                  opacity: state.buttonDisabled ? 0.5 : 1,
                                  child: CustomButton(
                                    text: _getButtonText(contextType),
                                    onTap: state.buttonDisabled
                                        ? () {}
                                        : () => context.read<OtpBloc>().add(
                                              VerifyOtpEvent(
                                                contextType: contextType,
                                                email: email,
                                              ),
                                            ),
                                  ),
                                ),
                                SpacersVertical.spacer30,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 8.w,
                                  children: [
                                    AppText.poppinsRegular(
                                      "Didn’t receive the email?",
                                      fontSize: 14,
                                      height: 20 / 14,
                                      color: AppColors.tealSecondary,
                                    ),
                                    GestureDetector(
                                      child: AppText.poppinsSemiBold(
                                        "Click to resend",
                                        fontSize: 14,
                                        height: 20 / 14,
                                        color: AppColors.orangePrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                SpacersVertical.spacer30,
                if (contextType == OtpContextType.resetPassword)
                  BackToLoginWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getButtonText(OtpContextType type) {
    switch (type) {
      case OtpContextType.signUp:
        return 'Verify Account';
      case OtpContextType.resetPassword:
        return 'Reset Password';
      case OtpContextType.changeEmail:
        return 'Confirm Email';
    }
  }
}
