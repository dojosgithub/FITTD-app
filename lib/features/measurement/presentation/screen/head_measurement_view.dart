import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';

import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/measurement/presentation/widgets/measurement_appbar.dart';
import 'package:fitted/features/measurement/presentation/widgets/measurement_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../bloc/bloc.dart';
import '../widgets/background_grid.dart';
import '../widgets/male_measurement_label.dart';

class HeadMeasurementView extends StatelessWidget {
  const HeadMeasurementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeasurementAppbarWidget(
        appbarTitle: "Head Circumference",
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: GridPainter(),
          ),
          // Positioned(
          //   top: 100.h,
          //   left: 15.w,
          //   child: FittedImageProvider.localSvg(
          //     imagePath: AppVectors.shareRounded,
          //   ),
          // ),
          Positioned(
            top: 140.h,
            child: Center(
              child: FittedImageProvider.localAsset(
                imagePath: AppImages.head2,
                imageSize: Size(1.sw, 268.h),
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 430.h,
            left: 135.w,
            child: MeasurementMarker(
              width: 110,
              part: "Head Circumference",
              value: formatMeasurement(context
                  .read<MeasurementBloc>()
                  .state
                  .otherMeasurementModel
                  .head),
              hasTop: true,
              hasbottom: false,
            ),
          ),

          Positioned(
            bottom: 70.h,
            left: 0,
            right: 0,
            child: Center(
              child: CustomButton(
                onTap: () => context
                    .pushNamed(AppRoutesEnum.headMeasurementFormView.name),
                text: "Update Measurements",
                height: 46.h,
                width: 319.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
