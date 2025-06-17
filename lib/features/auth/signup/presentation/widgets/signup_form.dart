import 'package:fitted/config/helper/form_validation/form_validator.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/auth/signup/presentation/bloc/bloc.dart';
import 'package:fitted/features/auth/signup/presentation/widgets/signup_buttons.dart';
import 'package:fitted/features/measurement/data/enums/measurement_route_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../verify_otp/data/enums/otp_enum.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: BlocConsumer<SignInBloc, SignInState>(
        listenWhen: (previous, current) =>
            previous.isSuccess != current.isSuccess,
        listener: (context, state) {
          final bloc = context.read<SignInBloc>();

          if (state.isSuccess && !state.isOAuthSuccess) {
            context.pushReplacementNamed(
              AppRoutesEnum.confirmOtp.name,
              queryParameters: {
                'email': state.email.text,
                'context': OtpContextType.signUp.name,
              },
            );
            bloc.add(ResetSignInState());
          } else if (state.isOAuthSuccess && !state.isSuccess) {
            context.pushReplacementNamed(
              AppRoutesEnum.userInfoView.name,
              queryParameters: {
                'context': MeasurementRouteEnum.home.name,
              },
            );
            bloc.add(ResetSignInState());
          } else if (state.isSuccess && state.isOAuthSuccess) {
            context.pushReplacementNamed(AppRoutesEnum.main.name);
            bloc.add(ResetSignInState());
          }
        },
        builder: (context, state) => Column(
          children: [
            FittedInputField.basic(
              label: 'Name',
              controller: state.name,
              hint: "Enter your name",
              validator: InputValidators.minLength(4),
            ),
            SpacersVertical.spacer16,
            FittedInputField.email(
              label: 'Email',
              controller: state.email,
            ),
            SpacersVertical.spacer16,
            FittedInputField.password(
              label: 'Password',
              controller: state.password,
              isHidden: state.seePassword,
              onToggle: () => context.read<SignInBloc>().add(
                    PasswordVisibilityChanged(
                      seePassword: !state.seePassword,
                      seeConfirmPassword: state.seeConfirmPassword,
                    ),
                  ),
            ),
            SpacersVertical.spacer16,
            FittedInputField.confirmPassword(
              label: 'Confirm Password',
              confirmController: state.confirmPassword,
              originalController: state.password,
              isHidden: state.seeConfirmPassword,
              onToggle: () => context.read<SignInBloc>().add(
                    PasswordVisibilityChanged(
                      seePassword: state.seePassword,
                      seeConfirmPassword: !state.seeConfirmPassword,
                    ),
                  ),
            ),
            SpacersVertical.spacer24,
            state.isLoading
                ? LoadingIndicator()
                : SignupButtons(
                    formKey: formKey,
                  ),
          ],
        ),
      ),
    );
  }
}
