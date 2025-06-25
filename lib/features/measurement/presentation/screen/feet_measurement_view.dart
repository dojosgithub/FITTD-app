import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/presentation/widgets/male_measurement_label.dart';
import 'package:fitted/features/measurement/presentation/widgets/measurement_appbar.dart';
import 'package:fitted/features/measurement/presentation/widgets/measurement_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../widgets/background_grid.dart';

class FeetMeasurementView extends StatelessWidget {
  const FeetMeasurementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeasurementAppbarWidget(
        appbarTitle: "Foot Measurement",
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
            top: 90.h,
            left: 0.w,
            right: 0.w,
            child: Center(
              child: FittedImageProvider.localAsset(
                imagePath: AppImages.feet2,
                imageSize: Size(255.w, 383.h),
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 420.h,
            left: 124.w,
            child: MeasurementMarker(
              width: 57,
              part: "Foot Width",
              value: formatMeasurement(context
                  .read<MeasurementBloc>()
                  .state
                  .otherMeasurementModel
                  .feetWidth),
              hasTop: true,
              hasbottom: false,
            ),
          ),
          Positioned(
            top: 280.h,
            right: 60.w,
            child: MeasurementMarker(
              width: 61,
              part: "Foot Length",
              value: formatMeasurement(context
                  .read<MeasurementBloc>()
                  .state
                  .otherMeasurementModel
                  .feetLength),
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
                    .pushNamed(AppRoutesEnum.feetMeasurementFormView.name),
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
