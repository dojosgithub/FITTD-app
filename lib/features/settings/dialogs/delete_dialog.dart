import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/profile/presentation/bloc/bloc.dart';
import 'package:fitted/features/settings/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/assets/icons.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listenWhen: (previous, current) =>
          previous.deleteAccountSucess != current.deleteAccountSucess,
      listener: (context, state) => state.deleteAccountSucess
          ? context.pushReplacementNamed(AppRoutesEnum.splash.name)
          : null,
      builder: (context, state) => Container(
        padding: EdgeInsets.all(12.w),
        height: context.read<ProfileBloc>().state.profile.accountType == "FITTD"
            ? 340.h
            : 270.h,
        width: 328.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SpacersVertical.spacer4,
            FittedImageProvider.localSvg(
              imagePath: AppVectors.delete,
              imageSize: Size(46.w, 43.h),
            ),
            SpacersVertical.spacer8,
            AppText.poppinsSemiBold(
              "Delete Account?",
              fontSize: 16,
              height: 24 / 16,
              color: AppColors.deepBurgundy,
            ),
            SpacersVertical.spacer8,
            Opacity(
              opacity: 0.6,
              child: AppText.poppinsMedium(
                "Are your sure you want to delete your account out? Deleting your account means deleting all data from the app.",
                fontSize: 12,
                height: 18 / 12,
                letterSpacing: 0.01 * 12,
                textAlign: TextAlign.center,
                color: AppColors.deepBurgundy.withValues(
                  alpha: 0.6,
                ),
              ),
            ),
            SpacersVertical.spacer16,
            if (context.read<ProfileBloc>().state.profile.accountType ==
                "FITTD")
              FittedInputField.password(
                label: "Type Password",
                isHidden: state.seePassword,
                onToggle: () =>
                    context.read<SettingsBloc>().add(PasswordVisibilityChanged(
                          seePassword: !state.seePassword,
                          seeConfirmPassword: state.seeConfirmPassword,
                        )),
                controller: state.deleteAccountController,
              ),
            SpacersVertical.spacer16,
            state.isLoading
                ? LoadingIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton.outline(
                        onTap: () => context.pop(),
                        text: "Go Back",
                        width: 128.w,
                        height: 52,
                        textStyle: AppTextStyles.poppinsBold(
                          fontSize: 16,
                          height: 24 / 16,
                          color: AppColors.orangePrimary,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      CustomButton(
                        onTap: () =>
                            context.read<SettingsBloc>().add(DeleteAccount()),
                        text: "Delete",
                        width: 128.w,
                        height: 52,
                        borderRadius: BorderRadius.circular(10.r),
                        backgroundColor: AppColors.red,
                      )
                    ],
                  ),
            SpacersVertical.spacer16,
          ],
        ),
      ),
    );
  }
}
