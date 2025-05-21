import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/measurement/presentation/widgets/measurement_appbar.dart';
import 'package:fitted/features/measurement/presentation/widgets/measurement_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../widgets/background_grid.dart';

class FaceMeasurementView extends StatelessWidget {
  const FaceMeasurementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeasurementAppbarWidget(
        appbarTitle: "Face Measurement",
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
            top: 75.h,
            left: 0.w,
            right: 0.w,
            child: Center(
              child: FittedImageProvider.localAsset(
                imagePath: AppImages.face2,
                imageSize: Size(286.w, 298.h),
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 410.h,
            left: 160.w,
            child: MeasurementMarker(
              width: 62,
              part: "Face Width",
              value: "12 cm",
              hasTop: true,
              hasbottom: false,
            ),
          ),
          Positioned(
            top: 150.h,
            right: 35.w,
            child: MeasurementMarker(
              width: 64,
              part: "Face Length",
              value: "12 cm",
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
                    .pushNamed(AppRoutesEnum.faceMeasurementFormView.name),
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
