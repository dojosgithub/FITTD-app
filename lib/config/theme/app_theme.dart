import 'package:fitted/config/colors/colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData get appTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'Poppins',
        useMaterial3: true,
      );
}
