import 'package:fitted/features/measurement/data/models/female_measurement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/assets/images.dart';
import '../../../../../config/helper/image_provider/fitted_image_provider.dart';
import 'male_measurement_label.dart';
import 'measurement_marker.dart';

class FemaleMeasurementLabelsPanel extends StatelessWidget {
  const FemaleMeasurementLabelsPanel({
    super.key,
    required this.measurementModel,
  });

  final FemaleMeasurementModel measurementModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FittedImageProvider.localSvg(
              //   imagePath: AppVectors.shareRounded,
              //   imageSize: Size(44.w, 44.h),
              //   boxFit: BoxFit.cover,
              // ),
              Transform.translate(
                offset: Offset(-80, -30),
                child: FittedImageProvider.localAsset(
                  imagePath: AppImages.female,
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
                    value: formatMeasurement(measurementModel.bust),
                    part: "Bust",
                    hasbottom: false,
                    width: 75,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.waist),
                    part: "Waist",
                    hasbottom: false,
                    width: 75,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.inseam),
                    part: "Inseam",
                    hasbottom: false,
                    width: 75,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.sleevesLength),
                    part: "Sleeves Length",
                    hasbottom: false,
                    width: 120,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.torsoHeight),
                    part: "Torso Height",
                    hasbottom: false,
                    width: 100,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.hip),
                    part: "Hips",
                    hasbottom: false,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
