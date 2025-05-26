import 'dart:developer';

import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/profile/presentation/bloc/bloc.dart';
import 'package:fitted/features/settings/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          bottom: 40.h,
          top: 68.h,
        ),
        child: BlocConsumer<SettingsBloc, SettingsState>(
          listenWhen: (previous, current) =>
              previous.isSucess != current.isSucess,
          listener: (context, state) => state.isSucess ? context.pop() : null,
          builder: (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedButton(
                onTap: () => context.pop(),
                child: Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: FittedImageProvider.localSvg(
                    imagePath: AppVectors.backArrow2,
                    imageSize: Size(13.w, 17.h),
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
              SpacersVertical.spacer16,
              AppText.poppinsRegular(
                'Change Password',
                fontSize: 27,
                color: AppColors.deepBurgundy,
              ),
              SpacersVertical.spacer26,
              AppText.poppinsRegular(
                'My Password',
                fontSize: 22,
                color: AppColors.deepBurgundy,
              ),
              SpacersVertical.spacer28,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    FittedInputField.password(
                      width: 1.sw,
                      label: "Current Password",
                      isHidden: state.seePassword,
                      controller: state.passwordController,
                      onToggle: () => context
                          .read<SettingsBloc>()
                          .add(PasswordVisibilityChanged(
                            seePassword: !state.seePassword,
                            seeConfirmPassword: state.seeConfirmPassword,
                          )),
                    ),
                    SpacersVertical.spacer28,
                    FittedInputField.password(
                      width: 1.sw,
                      label: "New Password",
                      controller: state.newPasswordController,
                      isHidden: state.seeConfirmPassword,
                      onToggle: () => context
                          .read<SettingsBloc>()
                          .add(PasswordVisibilityChanged(
                            seePassword: state.seePassword,
                            seeConfirmPassword: !state.seeConfirmPassword,
                          )),
                    ),
                  ],
                ),
              ),
              SpacersVertical.spacer40,
              Center(
                child: state.isLoading
                    ? LoadingIndicator()
                    : CustomButton(
                        text: "Update Password",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SettingsBloc>().add(ChangePassword(
                                  email: context
                                      .read<ProfileBloc>()
                                      .state
                                      .profile
                                      .email!,
                                ));
                          } else {
                            log('Form is not valid');
                          }
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
