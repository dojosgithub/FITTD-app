import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/auth/forgot_password/presentation/widgets/change_password_form.dart';
import 'package:fitted/features/measurement/presentation/widgets/measurement_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/background_grid.dart';

class MeasurementView extends StatelessWidget {
  const MeasurementView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.poppinsSemiBold(
                'All Measurements',
                fontSize: 20,
                height: 28 / 20,
                color: AppColors.black,
              ),
              SizedBox(height: 12.h),
              TabBar(
                indicatorColor: AppColors.orangePrimary,
                indicatorWeight: 2,
                labelColor: AppColors.black,
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppColors.black,
                labelStyle: AppTextStyles.poppinsSemiBold(
                  fontSize: 14,
                  height: 22 / 14,
                ),
                unselectedLabelStyle: AppTextStyles.poppinsRegular(
                  fontSize: 14,
                  height: 22 / 14,
                ),
                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: const [
                  Tab(text: 'Standard Measurements'),
                  Tab(text: 'Other Measurements'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: Size(1.sw, 1.sh),
                            painter: GridPainter(),
                          ),
                          Positioned(
                            left: -80,
                            top: -30,
                            child: FittedImageProvider.localAsset(
                              imagePath: AppImages.male,
                              imageSize: Size(1.sw, 0.65.sh),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 22, top: 22),
                            height: .62.sh,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MeasurementMarker(
                                      value: "32 cm",
                                      part: "Bust",
                                      hasbottom: false,
                                      width: 75,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                    ),
                                    MeasurementMarker(
                                      value: "32 cm",
                                      part: "Waist",
                                      hasbottom: false,
                                      width: 75,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                    ),
                                    MeasurementMarker(
                                      value: "32 cm",
                                      part: "Inseam",
                                      hasbottom: false,
                                      width: 75,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                    ),
                                    MeasurementMarker(
                                      value: "32 cm",
                                      part: "Sleeves Length",
                                      hasbottom: false,
                                      width: 120,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                    ),
                                    MeasurementMarker(
                                      value: "32 cm",
                                      part: "Torso Height",
                                      hasbottom: false,
                                      width: 100,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                    ),
                                    MeasurementMarker(
                                      value: "32 cm",
                                      part: "Hips",
                                      hasbottom: false,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                    ),
                                    MeasurementMarker(
                                      value: "32 cm",
                                      part: "Leg Height",
                                      hasbottom: false,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                    ),

                                    // Column(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceEvenly,
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Opacity(
                                    //       opacity: 0.8,
                                    //       child: AppText.poppinsSemiBold(
                                    //         "32 cm",
                                    //         fontSize: 14,
                                    //         height: 22 / 14,
                                    //         color: AppColors.charcoal,
                                    //       ),
                                    //     ),
                                    //     Opacity(
                                    //       opacity: 0.6,
                                    //       child: AppText.poppinsRegular(
                                    //         "Bust",
                                    //         fontSize: 11,
                                    //         height: 18 / 11,
                                    //         letterSpacing: -.03 * 12,
                                    //         color: AppColors.charcoal,
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 100,
                            left: 0.1.sw,
                            child: CustomButton(
                              text: "Update Measurements",
                              height: 46.h,
                              width: 319.w,
                            ),
                          )
                        ],
                      ),
                    ),
                    OtherMeasurements(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherMeasurements extends StatelessWidget {
  const OtherMeasurements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: otherMeasurementList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 160 / 200,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                width: 1,
                color: AppColors.black.withValues(alpha: 0.04),
              ),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withValues(
                    alpha: 0.5,
                  ),
                  offset: Offset(3, 6),
                  blurRadius: 4,
                )
              ]),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 160 / 98,
                child: FittedImageProvider.roundedRect(
                  imagePath: otherMeasurementList[index]['image'],
                  childImageType: AppImageType.local,
                  boxFit: BoxFit.cover,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 4.h,
                  children: [
                    AppText.poppinsSemiBold(
                      otherMeasurementList[index]['headline'],
                      fontSize: 14,
                      height: 22 / 14,
                      color: AppColors.black,
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                    ),
                    AppText.poppinsRegular(
                      otherMeasurementList[index]['baseline'],
                      fontSize: 10,
                      height: 18 / 10,
                      letterSpacing: 0.15 * 10,
                      color: AppColors.black.withValues(alpha: .6),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<Map> otherMeasurementList = [
  {
    "image": AppImages.feet,
    "headline": "Foot\nMeasurements",
    "baseline": "Foot Measurements for Shoes, slippers & any other footwear",
    "route": "",
  },
  {
    "image": AppImages.face,
    "headline": "Head\nCircumference",
    "baseline": "Foot Measurements for Shoes, slippers & any other footwear",
    "route": "",
  },
  {
    "image": AppImages.hand,
    "headline": "Hand\nMeasurements",
    "baseline": "Foot Measurements for Shoes, slippers & any other footwear",
    "route": "",
  },
  {
    "image": AppImages.face,
    "headline": "Face\nMeasurements",
    "baseline": "Foot Measurements for Shoes, slippers & any other footwear",
    "route": "",
  },
];
