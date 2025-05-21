import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/features/settings/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/helper/bottomsheet/image_picker_sheet.dart';
import '../../../../config/widgets/app_text.dart';
import '../../../main/data/mock_data.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

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
        child: BlocBuilder<SettingsBloc, SettingsState>(
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
              SpacersVertical.spacer18,
              AppText.poppinsRegular(
                ' Profile Information',
                fontSize: 27,
                color: AppColors.deepBurgundy,
              ),
              SpacersVertical.spacer34,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  state.image != null
                      ? Stack(
                          children: [
                            FittedImageProvider.circular(
                              imagePath: state.image!.path,
                              imageSize: Size.square(134.w),
                              boxFit: BoxFit.cover,
                              childImageType: AppImageType.file,
                            ),
                            Positioned(
                              top: 4,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<SettingsBloc>()
                                      .add(ClearImage());
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.orangePrimary,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : FittedImageProvider.circularNetwork(
                          imagePath: HomeMockData.avatarImg,
                          imageSize: Size.square(134.w),
                          boxFit: BoxFit.cover,
                        ),
                  CustomButton.icon(
                    text: "Upload New",
                    icon: AppVectors.upload,
                    iconSize: Size(24.w, 24.h),
                    width: 197.w,
                    height: 48.h,
                    onTap: state.image != null
                        ? null
                        : () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (ctx) => DraggableScrollableSheet(
                                    initialChildSize: 0.5,
                                    minChildSize: 0.5,
                                    maxChildSize: 0.5,
                                    builder: (ctx, scrollController) {
                                      return BottomSheet(
                                          enableDrag: false,
                                          showDragHandle: false,
                                          backgroundColor: Colors.white,
                                          onClosing: () {},
                                          builder: (ctx) {
                                            return PickImageBottomSheet(
                                              onCamera: () {
                                                context.pop();
                                                context
                                                    .read<SettingsBloc>()
                                                    .add(PickFromCamera());
                                              },
                                              onGallery: () {
                                                context.pop();
                                                context
                                                    .read<SettingsBloc>()
                                                    .add(PickFromGallery());
                                              },
                                            );
                                          });
                                    }));
                          },
                  ),
                ],
              ),
              SpacersVertical.spacer34,
              Divider(
                color: AppColors.deepBurgundy.withValues(alpha: 0.14),
              ),
              SpacersVertical.spacer42,
              FittedInputField(
                label: "First Name",
                width: 1.sw,
              ),
              SpacersVertical.spacer28,
              FittedInputField(
                label: "Last Name",
                width: 1.sw,
              ),
              SpacersVertical.spacer32,
              FittedInputField(
                label: "Email",
                width: 1.sw,
              ),
              Spacer(),
              Center(
                child: CustomButton(
                  text: "Upload New",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
