import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';

import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/features/main/data/mock_data.dart';
import 'package:fitted/features/profile/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ApparelHeader extends StatelessWidget {
  const ApparelHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      children: [
        context.read<ProfileBloc>().state.profile.imageUrl == null
            ? Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.grey,
                    width: 2,
                  ),
                ),
                alignment: Alignment.center,
                child: AppText.poppinsBold(
                  context
                      .read<ProfileBloc>()
                      .state
                      .profile
                      .name
                      .toString()
                      .substring(0, 2)
                      .toUpperCase(),
                  fontSize: 14,
                  color: AppColors.black,
                ),
              )
            : FittedImageProvider.circularNetwork(
                imagePath: context.read<ProfileBloc>().state.profile.imageUrl ??
                    HomeMockData.avatarImg,
                imageSize: Size.square(48.w),
                boxFit: BoxFit.cover,
              ),
        SizedBox(
          width: 0.4.sw,
          child: AppText.poppinsMedium(
            "Hello ${context.read<ProfileBloc>().state.profile.name ?? ""}",
            fontSize: 17,
            height: 22 / 17,
            color: AppColors.tealPrimary,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Spacer(),
        RoundedButton(
          onTap: () {
            context.pushNamed(AppRoutesEnum.notificationView.name);
          },
          child: FittedImageProvider.localSvg(
            imagePath: AppVectors.notification,
            imageSize: Size(18.w, 17.h),
            boxFit: BoxFit.contain,
          ),
        ),
        RoundedButton(
          child: FittedImageProvider.localSvg(
            imagePath: AppVectors.wishlist,
            imageSize: Size(18.w, 17.h),
            boxFit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
