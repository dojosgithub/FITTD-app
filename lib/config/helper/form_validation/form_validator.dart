import 'package:flutter/widgets.dart';

class InputValidators {
  static String? Function(String?) notEmpty(
      [String message = 'This field is required']) {
    return (value) => (value == null || value.trim().isEmpty) ? message : null;
  }

  static String? Function(String?) notEmptyOrZero({
    String emptyMessage = 'This field is required',
    String zeroMessage = 'Value cannot be zero',
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) return emptyMessage;

      final numValue = num.tryParse(value);
      if (numValue == null) return emptyMessage;
      if (numValue == 0) return zeroMessage;

      return null;
    };
  }

  static String? Function(String?) minLength(int minLength, [String? message]) {
    return (value) => (value != null && value.length < minLength)
        ? (message ?? 'Minimum $minLength characters required')
        : null;
  }

  static String? Function(String?) email(
      [String message = 'Enter a valid email']) {
    return (value) {
      if (value == null || value.isEmpty) return message;
      final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
      return emailRegex.hasMatch(value) ? null : message;
    };
  }

  static String? Function(String?) phone(
      [String message = 'Enter a valid phone number']) {
    return (value) {
      if (value == null || value.isEmpty) return message;
      final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
      return phoneRegex.hasMatch(value) ? null : message;
    };
  }

  static String? Function(String?) password() {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return 'Password is required';
      }

      final errors = <String>[];

      if (value.length < 8) {
        errors.add('at least 8 characters');
      }
      if (!RegExp(r'[A-Z]').hasMatch(value)) {
        errors.add('an uppercase letter');
      }
      if (!RegExp(r'[a-z]').hasMatch(value)) {
        errors.add('a lowercase letter');
      }
      if (!RegExp(r'\d').hasMatch(value)) {
        errors.add('a number');
      }
      if (!RegExp(r'[\W_]').hasMatch(value)) {
        errors.add('a special character');
      }

      return errors.isEmpty
          ? null
          : 'Password must contain ${errors.join(', ')}.';
    };
  }

  static String? Function(String?) confirmPassword(
      TextEditingController? originalController) {
    return (value) {
      if (value == null || value.isEmpty) return 'Confirm password is required';
      if (originalController == null || originalController.text != value) {
        return 'Passwords do not match';
      }
      return null;
    };
  }
}
