import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle base({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double height = 1.5,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    String? fontFamily,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color ?? Colors.white,
      height: height,
      fontStyle: fontStyle,
      decoration: decoration,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _poppinsBase({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double height = 1.5,
    double? letterSpacing,
  }) =>
      base(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
        fontFamily: "Poppins",
        letterSpacing: letterSpacing,
      );

  static TextStyle poppinsLight({
    required double fontSize,
    Color? color,
    double height = 1.5,
    double? letterSpacing,
  }) =>
      _poppinsBase(
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        color: color,
        height: height,
        letterSpacing: letterSpacing ?? 0,
      );

  static TextStyle poppinsRegular({
    required double fontSize,
    Color? color,
    double height = 1.5,
    double? letterSpacing,
  }) =>
      _poppinsBase(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: color,
          height: height,
          letterSpacing: letterSpacing);

  static TextStyle poppinsMedium({
    required double fontSize,
    Color? color,
    double? letterSpacing,
    double height = 1.5,
  }) =>
      _poppinsBase(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      );

  static TextStyle poppinsSemiBold({
    required double fontSize,
    double? letterSpacing,
    double? height,
    Color? color,
  }) =>
      _poppinsBase(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.34,
        letterSpacing: letterSpacing,
      );

  static TextStyle poppinsBold({
    required double fontSize,
    double? letterSpacing,
    Color? color,
    double height = 1.5,
  }) =>
      _poppinsBase(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: color,
          height: height,
          letterSpacing: letterSpacing);

  // Extra Bold
  static TextStyle poppinsExtraBold({
    required double fontSize,
    double? letterSpacing,
    Color? color,
    double height = 1.5,
  }) =>
      _poppinsBase(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          color: color,
          height: height,
          letterSpacing: letterSpacing);
}
