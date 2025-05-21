import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/features/measurement/data/enums/measurement_route_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/assets/images.dart';
import '../../../../../config/helper/image_provider/fitted_image_provider.dart';
import '../../../../../config/router/app_routes.dart';
import '../../../../../config/widgets/buttons/primary/primary_button.dart';
import '../background_grid.dart';
import '../measurement_marker.dart';

class StandardMeasurements extends StatelessWidget {
  const StandardMeasurements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: GridPainter(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedImageProvider.localSvg(
                      imagePath: AppVectors.shareRounded,
                      imageSize: Size(44.w, 44.h),
                      boxFit: BoxFit.cover,
                    ),
                    Transform.translate(
                      offset: Offset(-80, -80),
                      child: FittedImageProvider.localAsset(
                        imagePath: AppImages.male,
                        imageSize: Size(1.sw, 0.64.sh),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 22, top: 22),
                  child: SizedBox(
                    height: 0.58.sh,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MeasurementMarker(
                          value: "32 cm",
                          part: "Bust",
                          hasbottom: false,
                          width: 75,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        MeasurementMarker(
                          value: "32 cm",
                          part: "Waist",
                          hasbottom: false,
                          width: 75,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        MeasurementMarker(
                          value: "32 cm",
                          part: "Inseam",
                          hasbottom: false,
                          width: 75,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        MeasurementMarker(
                          value: "32 cm",
                          part: "Sleeves Length",
                          hasbottom: false,
                          width: 120,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        MeasurementMarker(
                          value: "32 cm",
                          part: "Torso Height",
                          hasbottom: false,
                          width: 100,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        MeasurementMarker(
                          value: "32 cm",
                          part: "Hips",
                          hasbottom: false,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        MeasurementMarker(
                          value: "32 cm",
                          part: "Leg Height",
                          hasbottom: false,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Center(
                  child: CustomButton(
                    onTap: () => context.pushNamed(
                        AppRoutesEnum.userInfoView.name,
                        queryParameters: {
                          'context': MeasurementRouteEnum.back.name,
                        }),
                    text: "Update Measurements",
                    height: 46.h,
                    width: 319.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
