import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/auth/login/presentation/bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 13.h,
      children: [
        CustomButton(
          text: "Log In",
          onTap: () {
            if (formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(LoginButtonPressed());
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
          onTap: () {
            context.read<LoginBloc>().add(GoogleSignInRequested());
          },
        ),
      ],
    );
  }
}
