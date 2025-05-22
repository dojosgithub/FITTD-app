import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/bloc.dart';
import '../widgets/tabs/other_measurement_tab.dart';
import '../widgets/tabs/standard_measurement_tab.dart';

class MeasurementView extends StatefulWidget {
  const MeasurementView({super.key, required this.index});

  final int? index;

  @override
  State<MeasurementView> createState() => _MeasurementViewState();
}

class _MeasurementViewState extends State<MeasurementView> {
  @override
  void initState() {
    context.read<MeasurementBloc>().add(GetMeasurements());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeasurementBloc, MeasurementState>(
      listenWhen: (context, state) => state.isLoading,
      listener: (context, state) {
        context.read<MeasurementBloc>().add(GetMeasurements());
      },
      builder: (context, state) {
        return state.isLoading
            ? LoadingIndicator()
            : DefaultTabController(
                initialIndex: widget.index == 0 ? 0 : 1,
                length: 2,
                child: SafeArea(
                  child: Container(
                    padding: EdgeInsets.all(12.w),
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
                          overlayColor:
                              WidgetStateProperty.all(Colors.transparent),
                          tabs: const [
                            Tab(text: 'Standard Measurements'),
                            Tab(text: 'Other Measurements'),
                          ],
                        ),
                        SpacersVertical.spacer20,
                        Expanded(
                          child: TabBarView(
                            children: [
                              StandardMeasurements(
                                state: state,
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
      },
    );
  }
}

List<Map> otherMeasurementList = [
  {
    "image": AppImages.feet,
    "headline": "Foot\nMeasurements",
    "baseline": "Foot Measurements for Shoes, slippers & any other footwear",
    "route": AppRoutesEnum.feetMeasurementView.name,
  },
  {
    "image": AppImages.head,
    "headline": "Head\nCircumference",
    "baseline": "Foot Measurements for Shoes, slippers & any other footwear",
    "route": AppRoutesEnum.headMeasurementView.name,
  },
  {
    "image": AppImages.hand,
    "headline": "Hand\nMeasurements",
    "baseline": "Foot Measurements for Shoes, slippers & any other footwear",
    "route": AppRoutesEnum.handMeasurementView.name,
  },
  {
    "image": AppImages.face,
    "headline": "Face\nMeasurements",
    "baseline": "Foot Measurements for Shoes, slippers & any other footwear",
    "route": AppRoutesEnum.faceMeasurementView.name,
  },
];






 // Positioned Approach





                    // Center(
                    //   child: Stack(
                    //     children: [
                    //       CustomPaint(
                    //         size: Size(1.sw, 1.sh),
                    //         painter: GridPainter(),
                    //       ),
                    //       Positioned(
                    //         left: -80,
                    //         top: -30,
                    //         child: FittedImageProvider.localAsset(
                    //           imagePath: AppImages.male,
                    //           imageSize: Size(1.sw, 0.65.sh),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.only(right: 22, top: 22),
                    //         height: .62.sh,
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.end,
                    //           children: [
                    //             Column(
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.spaceEvenly,
                    //               crossAxisAlignment: CrossAxisAlignment.end,
                    //               children: [
                    //                 MeasurementMarker(
                    //                   value: "32 cm",
                    //                   part: "Bust",
                    //                   hasbottom: false,
                    //                   width: 75,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.end,
                    //                 ),
                    //                 MeasurementMarker(
                    //                   value: "32 cm",
                    //                   part: "Waist",
                    //                   hasbottom: false,
                    //                   width: 75,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.end,
                    //                 ),
                    //                 MeasurementMarker(
                    //                   value: "32 cm",
                    //                   part: "Inseam",
                    //                   hasbottom: false,
                    //                   width: 75,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.end,
                    //                 ),
                    //                 MeasurementMarker(
                    //                   value: "32 cm",
                    //                   part: "Sleeves Length",
                    //                   hasbottom: false,
                    //                   width: 120,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.end,
                    //                 ),
                    //                 MeasurementMarker(
                    //                   value: "32 cm",
                    //                   part: "Torso Height",
                    //                   hasbottom: false,
                    //                   width: 100,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.end,
                    //                 ),
                    //                 MeasurementMarker(
                    //                   value: "32 cm",
                    //                   part: "Hips",
                    //                   hasbottom: false,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.end,
                    //                 ),
                    //                 MeasurementMarker(
                    //                   value: "32 cm",
                    //                   part: "Leg Height",
                    //                   hasbottom: false,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.end,
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Positioned(
                    //         bottom: 80,
                    //         left: 0.055.sw,
                    //         child: CustomButton(
                    //           text: "Update Measurements",
                    //           height: 46.h,
                    //           width: 319.w,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),