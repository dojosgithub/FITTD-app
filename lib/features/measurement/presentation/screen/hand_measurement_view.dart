import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/presentation/widgets/measurement_appbar.dart';
import 'package:fitted/features/measurement/presentation/widgets/measurement_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../widgets/background_grid.dart';
import '../widgets/male_measurement_label.dart';

class HandMeasurementView extends StatelessWidget {
  const HandMeasurementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeasurementAppbarWidget(
        appbarTitle: "Hand Measurement",
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
            top: 70.h,
            left: 0.w,
            right: 0.w,
            child: Center(
              child: FittedImageProvider.localAsset(
                imagePath: AppImages.hand2,
                imageSize: Size(330.07.w, 330.07.h),
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 430.h,
            left: 135.w,
            child: MeasurementMarker(
              width: 62,
              part: "Hand Width",
              value: formatMeasurement(context
                  .read<MeasurementBloc>()
                  .state
                  .otherMeasurementModel
                  .handWidth),
              hasTop: true,
              hasbottom: false,
            ),
          ),
          Positioned(
            top: 280.h,
            right: 40.w,
            child: MeasurementMarker(
              width: 67,
              part: "Hand Length",
              value: formatMeasurement(context
                  .read<MeasurementBloc>()
                  .state
                  .otherMeasurementModel
                  .handLength),
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
                    .pushNamed(AppRoutesEnum.handMeasurementFormView.name),
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
