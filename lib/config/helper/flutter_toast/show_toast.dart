import 'dart:ui';

import 'package:fitted/config/colors/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = AppColors.orangePrimary,
    Color textColor = AppColors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
