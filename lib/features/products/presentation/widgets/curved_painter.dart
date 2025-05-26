import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Curved360Overlay extends StatelessWidget {
  final double arcHeight;

  const Curved360Overlay({
    Key? key,
    this.arcHeight = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white,
                  AppColors.orangePrimary,
                  AppColors.orangePrimary,
                  Colors.white,
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: CustomPaint(
              size: Size(1.sw, 50.h),
              painter: _CurvedLinePainter(
                color: AppColors.orangePrimary,
                strokeWidth: 1,
                arcHeight: arcHeight,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 38.w,
                height: 38.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.orangePrimary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.orangePrimary,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: AppText.poppinsRegular(
                  '360°',
                  fontSize: 12,
                  letterSpacing: -0.02 * 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurvedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double arcHeight;

  _CurvedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.arcHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(
        size.width / 2,
        arcHeight,
        size.width,
        0,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CurvedLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.arcHeight != arcHeight;
  }
}
