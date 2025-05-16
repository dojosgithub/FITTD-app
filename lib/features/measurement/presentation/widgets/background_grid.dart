import 'package:fitted/config/colors/colors.dart';
import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.black.withValues(alpha: .1)
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
