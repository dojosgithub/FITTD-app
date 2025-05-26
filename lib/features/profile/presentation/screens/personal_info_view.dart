import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/form_validation/form_validator.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/profile/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/helper/bottomsheet/image_picker_sheet.dart';
import '../../../../config/widgets/app_text.dart';
import '../../../main/data/mock_data.dart';

class PersonalInfoView extends StatelessWidget {
  PersonalInfoView({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            bottom: 40.h,
            top: 68.h,
          ),
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listenWhen: (previous, current) =>
                previous.isSuccess != current.isSuccess,
            listener: (context, state) =>
                state.isSuccess ? context.pop() : null,
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
                                        .read<ProfileBloc>()
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
                        : state.profile.imageUrl == null
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
                                                      .read<ProfileBloc>()
                                                      .add(PickFromCamera());
                                                },
                                                onGallery: () {
                                                  context.pop();
                                                  context
                                                      .read<ProfileBloc>()
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FittedInputField.basic(
                        validator: InputValidators.notEmpty(),
                        label: "First Name",
                        width: 1.sw,
                        controller: state.firstName,
                      ),
                      // SpacersVertical.spacer28,
                      // FittedInputField.basic(
                      //   validator: InputValidators.notEmpty(),
                      //   label: "Last Name",
                      //   width: 1.sw,
                      // ),
                      SpacersVertical.spacer32,
                      FittedInputField.email(
                        label: "Email",
                        width: 1.sw,
                        controller: state.emailName,
                      ),
                    ],
                  ),
                ),
                SpacersVertical.spacer64,
                state.isLoading
                    ? LoadingIndicator()
                    : Center(
                        child: CustomButton(
                          text: "Save Changes",
                          onTap: () => _formKey.currentState!.validate()
                              ? context.read<ProfileBloc>().add(UpdateProfile())
                              : null,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
