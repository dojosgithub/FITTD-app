import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/auth/login/presentation/bloc/bloc.dart';
import 'package:fitted/features/auth/login/presentation/widgets/login_buttons.dart';
import 'package:fitted/features/auth/verify_otp/data/enums/otp_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/helper/flutter_toast/show_toast.dart';
import '../../../../measurement/data/enums/measurement_route_enum.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSuccess && state.hasMeasurements) {
            context.pushReplacementNamed(
              AppRoutesEnum.main.name,
            );
          } else if (state.isError && state.showVerfication) {
            context.pushReplacementNamed(
              AppRoutesEnum.confirmOtp.name,
              queryParameters: {
                'email': state.email.text,
                'context': OtpContextType.signUp.name,
              },
            );
          } else if (state.isSuccess && !state.hasMeasurements) {
            context.pushReplacementNamed(AppRoutesEnum.userInfoView.name,
                queryParameters: {
                  'context': MeasurementRouteEnum.home.name,
                });
          } else if (state.isError) {
            ToastUtil.showToast(
              message: state.errorMessage,
            );
          }
        },
        builder: (ctx, state) => Column(
          children: [
            FittedInputField.email(
              label: 'Email',
              controller: state.email,
            ),
            SpacersVertical.spacer16,
            SpacersVertical.spacer2,
            FittedInputField.password(
              label: 'Password',
              controller: state.password,
              isHidden: state.seePassword,
              isLogin: true,
              onToggle: () => context.read<LoginBloc>().add(
                    PasswordVisibilityChanged(
                      seePassword: !state.seePassword,
                    ),
                  ),
            ),
            SpacersVertical.spacer12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: state.rememberMe,
                      onChanged: (value) => context.read<LoginBloc>().add(
                            LoginRememberMeChanged(
                              rememberMe: value!,
                            ),
                          ),
                      activeColor: AppColors.orangePrimary,
                      side: BorderSide(
                        color: AppColors.grey,
                        width: 1,
                      ),
                      checkColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    AppText.poppinsMedium(
                      "Remember for 30 days",
                      fontSize: 14,
                      height: 20 / 14,
                      color: AppColors.tealPrimary,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () => context.pushNamed(
                    AppRoutesEnum.forgotPassword.name,
                  ),
                  child: AppText.poppinsSemiBold(
                    "Forgot password",
                    fontSize: 14,
                    height: 20 / 14,
                    color: AppColors.orangePrimary,
                  ),
                ),
              ],
            ),
            SpacersVertical.spacer10,
            state.isLoading
                ? LoadingIndicator()
                : LoginButtons(
                    formKey: formKey,
                  ),
          ],
        ),
      ),
    );
  }
}
