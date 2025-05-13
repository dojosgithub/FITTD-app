import 'dart:developer';

import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/auth/signup/presentation/bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupButtons extends StatelessWidget {
  const SignupButtons({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 13.h,
      children: [
        CustomButton(
          text: "Sign Up",
          onTap: () {
            if (formKey.currentState!.validate()) {
              context.read<SignInBloc>().add(
                    SignInButtonPressed(),
                  );
            } else {
              log('Form is not valid');
            }
          },
        ),
        CustomButton.iconAndOutline(
          text: "Sign in with Google",
          iconSize: Size(24.w, 24.h),
          icon: AppVectors.google,
          textStyle: AppTextStyles.poppinsSemiBold(
            fontSize: 16,
            color: AppColors.tealPrimary,
            height: 24 / 16,
          ),
          borderColor: AppColors.grey,
          borderWidth: 1,
          onTap: () {},
        ),
      ],
    );
  }
}
