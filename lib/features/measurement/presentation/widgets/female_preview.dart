import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/features/measurement/data/models/female_measurement_model.dart';
import 'package:flutter/material.dart';

import 'background_grid.dart';
import 'measurement_marker.dart';

class FemaleSizePreview extends StatelessWidget {
  const FemaleSizePreview({
    super.key,
    required this.width,
    required this.height,
    required this.model,
  });

  final double width;
  final double height;
  final FemaleMeasurementModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(width, height),
          painter: GridPainter(),
        ),
        Align(
          alignment: Alignment(-0.8, -0.42),
          child: MeasurementMarker(
            value: "${model.bust.value} ${model.bust.unit.name}",
            part: "Bust",
          ),
        ),
        Align(
          alignment: Alignment(-0.8, -0.015),
          child: MeasurementMarker(
            value: "${model.waist.value} ${model.waist.unit.name}",
            part: "Waist",
            hasTop: true,
            hasbottom: false,
            height: 60,
          ),
        ),
        Align(
          alignment: Alignment(-0.8, 0.13),
          child: MeasurementMarker(
            value: "${model.hip.value} ${model.hip.unit.name}",
            part: "Hips",
            hasTop: true,
            hasbottom: false,
          ),
        ),
        Align(
          alignment: Alignment(-0.7, 0.4),
          child: MeasurementMarker(
            value: "${model.inseam.value} ${model.inseam.unit.name}",
            part: "Inseams",
            height: 60,
            hasTop: true,
            hasbottom: false,
          ),
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
            imagePath: AppImages.female1,
            imageSize: Size(width * 0.6, height * 0.8),
          ),
        ),
      ],
    );
  }
}
