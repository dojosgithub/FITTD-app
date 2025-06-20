import 'package:fitted/config/assets/icons.dart';

import 'package:fitted/features/measurement/data/models/male_measurement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/assets/images.dart';
import '../../../../../config/helper/image_provider/fitted_image_provider.dart';
import '../../data/models/measurement_model.dart';
import 'measurement_marker.dart';

class MaleMeasurementLabelsPanel extends StatelessWidget {
  const MaleMeasurementLabelsPanel({
    super.key,
    required this.measurementModel,
  });

  final MaleMeasurementModel measurementModel;

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
              Transform.translate(
                offset: Offset(-80, -30),
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
            padding: const EdgeInsets.only(right: 22, top: 10),
            child: SizedBox(
              height: 0.6.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.shoulderWidth),
                    part: "Soulder Width",
                    hasbottom: false,
                    width: 75,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.sleevesLength),
                    part: "Sleeves length",
                    hasbottom: false,
                    width: 78,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.chest),
                    part: "Chest",
                    hasbottom: false,
                    width: 75,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.bicep),
                    part: "Bicep",
                    hasbottom: false,
                    width: 75,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.torsoHeight),
                    part: "Torso height",
                    hasbottom: false,
                    width: 120,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.waist),
                    part: "Waist",
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
                  MeasurementMarker(
                    value:
                        formatMeasurement(measurementModel.thighCircumference),
                    part: "Thigh Circumference",
                    hasbottom: false,
                    width: 112,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.inseam),
                    part: "Inseams",
                    hasbottom: false,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  MeasurementMarker(
                    value: formatMeasurement(measurementModel.legLength),
                    part: "Leg Height",
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

String formatMeasurement(Measurement? m) {
  if (m == null) return "-";
  return "${m.value.toInt()} ${m.unit.name}";
}
