import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/auth/signup/presentation/widgets/signup_form.dart';
import 'package:fitted/features/auth/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 368.w,
              margin: EdgeInsets.only(
                top: 88.h,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  AuthLogo(),
                  SpacersVertical.spacer56,
                  AppText.poppinsSemiBold(
                    "Create an account",
                    fontSize: 24,
                    height: 32 / 24,
                    color: AppColors.tealPrimary,
                  ),
                  SpacersVertical.spacer4,
                  AppText.poppinsRegular(
                    "Set up your account with us.\nPlease fill the below details to create the account.",
                    fontSize: 14,
                    height: 22 / 14,
                    letterSpacing: 0.02 * 14,
                    color: AppColors.tealPrimary,
                    textAlign: TextAlign.center,
                  ),
                  SpacersVertical.spacer22,
                  SignupFormWidget(
                    formKey: _formKey,
                  ),
                  SpacersVertical.spacer36,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8.w,
                    children: [
                      AppText.poppinsRegular(
                        "Already have an account?",
                        fontSize: 14,
                        height: 20 / 14,
                        color: AppColors.tealSecondary,
                      ),
                      GestureDetector(
                        onTap: () => context.pushReplacementNamed(
                          AppRoutesEnum.login.name,
                        ),
                        child: AppText.poppinsSemiBold(
                          "Log In",
                          fontSize: 14,
                          height: 20 / 14,
                          color: AppColors.orangePrimary,
                        ),
                      ),
                    ],
                  ),
                  SpacersVertical.spacer36,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
