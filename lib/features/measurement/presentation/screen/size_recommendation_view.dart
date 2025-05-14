import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeRecommendationView extends StatelessWidget {
  const SizeRecommendationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            painter: GridPainter(),
          ),
          Positioned(
            top: 0.28.sh,
            left: 0.07.sw,
            child: MeasurementMarker(
              value: "30 cm",
              part: "Bust",
            ),
          ),
          Positioned(
            top: 0.36.sh,
            left: 0.07.sw,
            child: MeasurementMarker(
              value: "30 cm",
              part: "Upper Waist",
            ),
          ),
          Positioned(
            top: 0.45.sh,
            left: 0.07.sw,
            child: MeasurementMarker(
              value: "36 cm",
              part: "Lower Waist",
              hasTop: true,
              height: 60,
            ),
          ),
          Positioned(
            top: 0.52.sh,
            left: 0.07.sw,
            child: MeasurementMarker(
              value: "30 cm",
              part: "Hips",
              hasbottom: false,
            ),
          ),
          Positioned(
            top: 0.64.sh,
            left: 0.14.sw,
            child: MeasurementMarker(
              value: "30 cm",
              part: "Inseams",
              height: 60,
              hasTop: true,
              hasbottom: false,
            ),
          ),
          Positioned(
            top: 0.26.sh,
            right: 0.25.sw,
            child: Container(
              width: 19.w,
              height: 205.h,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.black,
                    width: 1,
                  ),
                  top: BorderSide(
                    color: AppColors.black,
                    width: 1,
                  ),
                  right: BorderSide(
                    color: AppColors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.312.sh,
            right: -0.003.sw,
            child: MeasurementMarker(
              value: "  20 cm",
              part: "  Sleeves length",
              width: 112,
              height: 60,
            ),
          ),
          Positioned(
            top: 0.39.sh,
            right: 0.04.sw,
            child: MeasurementMarker(
              value: "38 cm",
              part: "Torso height",
            ),
          ),
          Positioned(
            top: 0.52.sh,
            right: 0.2.sw,
            child: Container(
              width: 19.w,
              height: 280.h,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.black,
                    width: 1,
                  ),
                  top: BorderSide(
                    color: AppColors.black,
                    width: 1,
                  ),
                  right: BorderSide(
                    color: AppColors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.63.sh,
            right: -0.03.sw,
            child: MeasurementMarker(
              value: "38 cm",
              part: "Leg height",
              hasTop: false,
              hasbottom: false,
            ),
          ),
          Center(
            child: FittedImageProvider.localAsset(
              imagePath: AppImages.male,
              imageSize: Size(0.8.sw, 0.8.sh),
              boxFit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class MeasurementMarker extends StatelessWidget {
  const MeasurementMarker({
    super.key,
    required this.part,
    required this.value,
    this.height,
    this.width,
    this.hasTop = false,
    this.hasbottom = true,
  });

  final String part;
  final String value;
  final bool hasTop;
  final bool hasbottom;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 79.w,
      height: height ?? 45.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: hasbottom
              ? BorderSide(
                  color: AppColors.black,
                  width: 1,
                )
              : BorderSide(
                  color: AppColors.white,
                  width: 0,
                ),
          top: hasTop
              ? BorderSide(
                  color: AppColors.black,
                  width: 1,
                )
              : BorderSide(
                  color: AppColors.white,
                  width: 0,
                ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: 0.8,
            child: AppText.poppinsSemiBold(
              value,
              fontSize: 14,
              height: 22 / 14,
              color: AppColors.charcoal,
            ),
          ),
          Opacity(
            opacity: 0.6,
            child: AppText.poppinsRegular(
              part,
              fontSize: 12,
              height: 18 / 12,
              color: AppColors.charcoal,
            ),
          )
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.black.withValues(alpha: .2) // Grid line color
      ..strokeWidth = 1;

    double cellWidth = size.width / 4;
    double cellHeight = size.height / 8;

    // Draw vertical lines
    for (int i = 1; i < 10; i++) {
      canvas.drawLine(
        Offset(cellWidth * i, 0),
        Offset(cellWidth * i, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (int i = 1; i < 8; i++) {
      canvas.drawLine(
        Offset(0, cellHeight * i),
        Offset(size.width, cellHeight * i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
