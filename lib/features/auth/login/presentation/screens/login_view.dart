import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';

import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/auth/login/presentation/widgets/login_form.dart';
import 'package:fitted/features/auth/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final formKey = GlobalKey<FormState>();
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
                  SpacersVertical.spacer64,
                  AppText.poppinsSemiBold(
                    "Log in to your account",
                    fontSize: 24,
                    height: 32 / 24,
                    color: AppColors.tealPrimary,
                  ),
                  SpacersVertical.spacer6,
                  AppText.poppinsRegular(
                    "Welcome back! Please enter your details.",
                    fontSize: 16,
                    height: 24 / 16,
                    color: AppColors.tealPrimary,
                  ),
                  SpacersVertical.spacer32,
                  LoginFormWidget(
                    formKey: formKey,
                  ),
                  SpacersVertical.spacer36,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8.w,
                    children: [
                      AppText.poppinsRegular(
                        "Don’t have an account?",
                        fontSize: 14,
                        height: 20 / 14,
                        color: AppColors.tealSecondary,
                      ),
                      GestureDetector(
                        onTap: () => context.pushReplacementNamed(
                          AppRoutesEnum.signup.name,
                        ),
                        child: AppText.poppinsSemiBold(
                          "Sign up",
                          fontSize: 14,
                          height: 20 / 14,
                          color: AppColors.orangePrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
