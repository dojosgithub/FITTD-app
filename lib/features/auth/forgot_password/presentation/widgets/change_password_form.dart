import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/auth/forgot_password/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordFormWidget extends StatelessWidget {
  const ChangePasswordFormWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state.isResetSucess) {
          context.pushReplacementNamed(
              AppRoutesEnum.passwordResetConfirmView.name);
        }
      },
      builder: (context, state) => Form(
        key: formKey,
        child: Column(
          children: [
            FittedInputField.password(
              label: "Password",
              controller: state.passwordController,
              isHidden: state.seePassword,
              onToggle: () => context
                  .read<ForgotPasswordBloc>()
                  .add(PasswordVisibilityChanged(
                    seePassword: !state.seePassword,
                    seeConfirmPassword: state.seeConfirmPassword,
                  )),
            ),
            SpacersVertical.spacer2,
            Align(
              alignment: Alignment.centerLeft,
              child: AppText.poppinsRegular(
                "Must be at least 8 characters",
                fontSize: 14,
                height: 20 / 14,
                color: AppColors.tealSecondary,
              ),
            ),
            SpacersVertical.spacer20,
            FittedInputField.password(
              label: "Confirm Password",
              controller: state.confirmPasswordController,
              isHidden: state.seeConfirmPassword,
              onToggle: () => context
                  .read<ForgotPasswordBloc>()
                  .add(PasswordVisibilityChanged(
                    seePassword: state.seePassword,
                    seeConfirmPassword: !state.seeConfirmPassword,
                  )),
            ),
            SpacersVertical.spacer20,
            state.isLoading
                ? LoadingIndicator()
                : CustomButton(
                    text: "Reset Password",
                    onTap: () {
                      formKey.currentState!.validate()
                          ? context.read<ForgotPasswordBloc>().add(
                                ChangePasswordEvent(),
                              )
                          : null;
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
