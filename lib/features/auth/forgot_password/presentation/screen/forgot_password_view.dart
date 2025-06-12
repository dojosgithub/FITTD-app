import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/auth/forgot_password/presentation/bloc/bloc.dart';
import 'package:fitted/features/auth/verify_otp/data/enums/otp_enum.dart';
import 'package:fitted/features/auth/widgets/back_to_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/widgets/app_text.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 96.w),
        child: Center(
          child: SizedBox(
            width: 342.w,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  FittedImageProvider.localSvg(
                    imagePath: AppVectors.key,
                  ),
                  SpacersVertical.spacer20,
                  SpacersVertical.spacer2,
                  AppText.poppinsSemiBold(
                    "Forgot password?",
                    fontSize: 24,
                    height: 32 / 24,
                    color: AppColors.tealPrimary,
                  ),
                  SpacersVertical.spacer4,
                  AppText.poppinsRegular(
                    "No worries, we’ll send you reset instructions.",
                    fontSize: 16,
                    height: 24 / 16,
                    color: AppColors.tealSecondary,
                    textAlign: TextAlign.center,
                  ),
                  SpacersVertical.spacer32,
                  BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                    listener: (context, state) {
                      if (state.isEmailSucess) {
                        context.pushReplacementNamed(
                          AppRoutesEnum.confirmOtp.name,
                          queryParameters: {
                            'email': state.emailController.text,
                            'context': OtpContextType.resetPassword.name,
                          },
                        );
                      }
                    },
                    builder: (context, state) => Column(
                      spacing: 20.h,
                      children: [
                        FittedInputField.email(
                          label: 'Email',
                          controller: state.emailController,
                        ),
                        state.isLoading
                            ? LoadingIndicator()
                            : CustomButton(
                                text: "Reset Password",
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    context.read<ForgotPasswordBloc>().add(
                                          SendEmailEvent(),
                                        );
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                  SpacersVertical.spacer30,
                  BackToLoginWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
