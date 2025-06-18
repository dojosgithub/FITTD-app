import 'package:fitted/config/helper/flutter_toast/show_toast.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/features/profile/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/assets/icons.dart';
import '../widgets/section_seprator.dart';
import '../widgets/settings_card.dart';
import '../widgets/settings_section.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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
        child: Column(
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
            SpacersVertical.spacer13,
            SettingsSection(
              title: "PROFILE",
              items: [
                SettingsCard(
                    title: "Edit Profile",
                    subtitle: "View & edit your profile details",
                    icon: AppVectors.profile,
                    onTap: () {
                      context.pushNamed(AppRoutesEnum.personalInfoView.name);
                    }),
                SettingsCard(
                    title: "Change Password",
                    subtitle: 'You can change your password',
                    icon: AppVectors.lock,
                    onTap: () {
                      context.read<ProfileBloc>().state.profile.accountType !=
                              "FITTD"
                          ? ToastUtil.showToast(
                              message:
                                  "Password for Google Account can't be changed.")
                          : context
                              .pushNamed(AppRoutesEnum.changePasswordView.name);
                    }),
              ],
            ),
            const SectionSeparator(),
            SettingsSection(
              title: "SETTINGS",
              items: [
                SettingsCard(
                  title: "Terms & Conditions",
                  subtitle: "Read our terms & Conditions",
                  icon: AppVectors.term,
                  onTap: () => context
                      .pushNamed(AppRoutesEnum.termsAndConditionsView.name),
                ),
                SettingsCard(
                  title: "Privacy Policy",
                  subtitle: 'Read our Privacy Policy',
                  icon: AppVectors.privacy,
                  onTap: () => context
                      .pushNamed(AppRoutesEnum.privacyAndPolicyView.name),
                ),
              ],
            ),
            const SectionSeparator(),
            SettingsSection(
              title: "OTHER",
              items: [
                SettingsCard(
                  title: "Delete Account",
                  subtitle: "Logout from the app easily",
                  icon: AppVectors.term,
                  onTap: () =>
                      context.pushNamed(AppRoutesEnum.deleteDialog.name),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: CustomButton.icon(
                text: "Log Out",
                icon: AppVectors.signOut,
                iconSize: Size(24.w, 24.h),
                onTap: () => context.pushNamed(AppRoutesEnum.logOutDialog.name),
              ),
            )
          ],
        ),
      ),
    );
  }
}
