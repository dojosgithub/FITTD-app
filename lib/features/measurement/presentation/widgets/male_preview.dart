import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:flutter/material.dart';

import '../../data/models/male_measurement_model.dart';
import 'background_grid.dart';
import 'measurement_marker.dart';

class MaleSizePreview extends StatelessWidget {
  const MaleSizePreview({
    super.key,
    required this.width,
    required this.height,
    required this.model,
  });

  final double width;
  final double height;
  final MaleMeasurementModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(width, height),
          painter: GridPainter(),
        ),
        Align(
          alignment: Alignment(0.48, -0.28),
          child: Container(
            width: width * 0.04,
            height: height * 0.22,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.black,
                  width: 0.5,
                ),
                top: BorderSide(
                  color: AppColors.black,
                  width: 0.5,
                ),
                right: BorderSide(
                  color: AppColors.black,
                  width: 0.5,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(-0.8, -0.47),
          child: MeasurementMarker(
            value:
                "${model.shoulderWidth.value} ${model.shoulderWidth.unit.name}",
            part: "Shoulder Width",
            width: 90,
          ),
        ),
        Align(
          alignment: Alignment(-0.8, -0.33),
          child: MeasurementMarker(
            value: "${model.chest.value} ${model.chest.unit.name}",
            part: "Chest",
          ),
        ),
        Align(
          alignment: Alignment(-0.8, -0.19),
          child: MeasurementMarker(
            value: "${model.bicep.value} ${model.bicep.unit.name}",
            part: "Bicep",
          ),
        ),
        Align(
          alignment: Alignment(-0.8, -.06),
          child: MeasurementMarker(
            value: "${model.waist.value} ${model.waist.unit.name}",
            part: "Waist",
          ),
        ),
        Align(
          alignment: Alignment(-0.8, 0.09),
          child: MeasurementMarker(
            value: "${model.hip.value} ${model.hip.unit.name}",
            part: "Hips",
          ),
        ),
        Align(
          alignment: Alignment(-0.8, .25),
          child: MeasurementMarker(
            value:
                "${model.thighCircumference.value} ${model.thighCircumference.unit.name}",
            part: "Thigh Circumference",
            width: 100,
            height: 65,
          ),
        ),
        Align(
          alignment: Alignment(-0.8, .39),
          child: MeasurementMarker(
            value: "${model.inseam.value} ${model.inseam.unit.name}",
            part: "Inseams",
            hasbottom: false,
          ),
        ),
        Align(
          alignment: Alignment(0.95, -0.345),
          child: MeasurementMarker(
            value:
                "  ${model.sleevesLength.value} ${model.sleevesLength.unit.name}",
            part: "  Sleeves length",
            width: 90,
            height: 60,
          ),
        ),
        Align(
          alignment: Alignment(0.95, -0.14),
          child: MeasurementMarker(
            value:
                "  ${model.torsoHeight.value} ${model.torsoHeight.unit.name}",
            part: "  Torso height",
            width: 90,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: FittedImageProvider.localAsset(
            imagePath: AppImages.male,
            imageSize: Size(width * 0.5, height * 0.8),
            boxFit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
