import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/form_validation/form_validator.dart';

class FittedInputField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Widget? prefixIcon; // Add this line

  const FittedInputField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.validator,
    this.prefixIcon, // Include here
  });

  factory FittedInputField.email({
    required String label,
    String? hint,
    TextEditingController? controller,
  }) {
    return FittedInputField(
      label: label,
      hint: hint ?? 'Enter your email',
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: InputValidators.email(),
    );
  }

  factory FittedInputField.password({
    required String label,
    String? hint,
    required bool isHidden,
    required VoidCallback onToggle,
    TextEditingController? controller,
    int minLength = 8,
    bool isLogin = false,
  }) {
    return FittedInputField(
      label: label,
      hint: hint ?? '',
      obscureText: isHidden,
      controller: controller,
      suffixIcon: IconButton(
        icon: Icon(
          isHidden ? Icons.visibility_off : Icons.visibility,
          color: AppColors.grey,
        ),
        onPressed: onToggle,
      ),
      validator:
          isLogin ? InputValidators.minLength(2) : InputValidators.password(),
    );
  }

  factory FittedInputField.phone({
    required String label,
    String? hint,
    TextEditingController? controller,
  }) {
    return FittedInputField(
      label: label,
      hint: hint ?? 'Enter your phone number',
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: InputValidators.phone(),
    );
  }

  factory FittedInputField.confirmPassword({
    required String label,
    String? hint,
    required bool isHidden,
    required VoidCallback onToggle,
    required TextEditingController? confirmController,
    required TextEditingController? originalController,
  }) {
    return FittedInputField(
      label: label,
      hint: hint ?? '',
      obscureText: isHidden,
      controller: confirmController,
      suffixIcon: IconButton(
        icon: Icon(
          isHidden ? Icons.visibility_off : Icons.visibility,
          color: AppColors.grey,
        ),
        onPressed: onToggle,
      ),
      validator: InputValidators.confirmPassword(originalController),
    );
  }

  factory FittedInputField.basic(
      {required String label,
      String? hint,
      TextEditingController? controller,
      String? Function(String?)? validator}) {
    return FittedInputField(
      label: label,
      hint: hint ?? 'Enter your $label',
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
    );
  }
  factory FittedInputField.withIcon({
    required String label,
    String? hint,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
  }) {
    return FittedInputField(
      label: label,
      hint: hint ?? 'Enter your $label',
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(36.r),
      borderSide: BorderSide(
        color: AppColors.grey,
      ),
    );
    return SizedBox(
      width: 342.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.poppinsMedium(
            label,
            fontSize: 14,
            height: 20 / 14,
            color: AppColors.tealPrimary,
          ),
          SpacersVertical.spacer4,
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            cursorColor: AppColors.orangePrimary,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.poppinsRegular(
                fontSize: 16,
                height: 24 / 16,
                color: AppColors.tealSecondary,
              ),
              errorMaxLines: 2,
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              disabledBorder: outlineInputBorder,
              focusedErrorBorder: outlineInputBorder,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
