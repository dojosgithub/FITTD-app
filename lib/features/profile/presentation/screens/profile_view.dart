import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/main/data/mock_data.dart';
import 'package:fitted/features/profile/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/assets/icons.dart';
import '../../../../config/helper/image_provider/fitted_image_provider.dart';
import '../../../../config/widgets/product_card.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) => state.isLoading
            ? LoadingIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 68.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RoundedButton(
                            child: Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: FittedImageProvider.localSvg(
                                imagePath: AppVectors.notification,
                                imageSize: Size(13.w, 17.h),
                                boxFit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Spacers.spacer16,
                          RoundedButton(
                            onTap: () =>
                                context.pushNamed(AppRoutesEnum.settings.name),
                            child: Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: FittedImageProvider.localSvg(
                                imagePath: AppVectors.settings,
                                imageSize: Size(13.w, 17.h),
                                boxFit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SpacersVertical.spacer18,
                      AppText.poppinsRegular(
                        ' My Profile',
                        fontSize: 27,
                        color: AppColors.black,
                      ),
                      SpacersVertical.spacer34,
                      Row(
                        spacing: 35.w,
                        children: [
                          state.profile.imageUrl == null
                              ? Container(
                                  height: 134.h,
                                  width: 134.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: AppText.poppinsBold(
                                    state.profile.name
                                        .toString()
                                        .substring(0, 2)
                                        .toUpperCase(),
                                    fontSize: 28,
                                    color: AppColors.black,
                                  ),
                                )
                              : FittedImageProvider.circularNetwork(
                                  imagePath: state.profile.imageUrl ??
                                      HomeMockData.avatarImg,
                                  imageSize: Size.square(134.w),
                                  boxFit: BoxFit.cover,
                                ),
                          Column(
                            spacing: 13.w,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.poppinsMedium(
                                state.profile.name.toString(),
                                fontSize: 22,
                                color: AppColors.black,
                              ),
                              Row(
                                spacing: 10.w,
                                children: [
                                  FittedImageProvider.localSvg(
                                    imagePath: AppVectors.email,
                                    imageSize: Size(13.w, 17.h),
                                    boxFit: BoxFit.contain,
                                  ),
                                  AppText.poppinsRegular(
                                    state.profile.email.toString(),
                                    fontSize: 14,
                                    color: AppColors.tealSecondary,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SpacersVertical.spacer24,
                      Divider(
                        color: AppColors.deepBurgundy.withValues(alpha: 0.14),
                      ),
                      SpacersVertical.spacer26,
                      AppText.poppinsRegular(
                        ' Wishlist',
                        fontSize: 22,
                        color: AppColors.black,
                      ),
                      SpacersVertical.spacer34,
                      GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 171 / 237,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            height: 180.h,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
