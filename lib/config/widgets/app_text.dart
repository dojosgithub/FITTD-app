import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText._({
    required this.text,
    required this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    super.key,
  });

  factory AppText.poppinsRegular(
    String text, {
    required double fontSize,
    Color? color,
    double height = 1.5,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
  }) =>
      AppText._(
        text: text,
        style: AppTextStyles.poppinsRegular(
            fontSize: fontSize,
            color: color,
            height: height,
            letterSpacing: letterSpacing),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.poppinsLight(
    String text, {
    required double fontSize,
    Color? color,
    double height = 1.5,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
  }) =>
      AppText._(
        text: text,
        style: AppTextStyles.poppinsLight(
          fontSize: fontSize,
          color: color,
          height: height,
          letterSpacing: letterSpacing,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.poppinsMedium(
    String text, {
    required double fontSize,
    Color? color,
    double height = 1.5,
    double? letterSpacing,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppText._(
        text: text,
        style: AppTextStyles.poppinsMedium(
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          color: color,
          height: height,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.poppinsSemiBold(
    String text, {
    required double fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    Key? key,
    double? height,
    double? letterSpacing,
  }) =>
      AppText._(
        key: key,
        text: text,
        style: AppTextStyles.poppinsSemiBold(
            fontSize: fontSize,
            color: color,
            letterSpacing: letterSpacing,
            height: height),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.poppinsBold(
    String text, {
    required double fontSize,
    double? letterSpacing,
    Color? color,
    double height = 1.5,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      AppText._(
        text: text,
        style: AppTextStyles.poppinsBold(
            fontSize: fontSize,
            color: color,
            height: height,
            letterSpacing: letterSpacing),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  factory AppText.poppinsExtraBold(
    String text, {
    required double fontSize,
    Color? color,
    double height = 1.5,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
  }) =>
      AppText._(
        text: text,
        style: AppTextStyles.poppinsExtraBold(
            fontSize: fontSize,
            color: color,
            height: height,
            letterSpacing: letterSpacing),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      textScaler: const TextScaler.linear(1),
    );
  }
}
