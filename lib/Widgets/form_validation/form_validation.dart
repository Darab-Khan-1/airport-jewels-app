import 'dart:math';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

String? Function(String?)? requiredValidator({String? error}) {
  return RequiredValidator(errorText: error ?? 'This field is required*').call;
}

MultiValidator emailValidator() {
  return MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Invalid email address'),
  ]);
}

MultiValidator passwordValidator() {
  return MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    MaxLengthValidator(20,
        errorText: 'Password must not be more than 20 digits long'),
  ]);
}

MultiValidator newpasswordValidator() {
  return MultiValidator([
    RequiredValidator(errorText: 'New Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
    MaxLengthValidator(20,
        errorText: 'Password must not be more than 20 digits long'),
  ]);
}

MultiValidator expiryValidator() {
  return MultiValidator([
    RequiredValidator(errorText: 'Expiry date is required.'),
    PatternValidator(
      r'^(0[1-9]|1[0-2])\/\d{4}$',
      errorText: 'Enter a valid date in MM/YYYY format.',
    ),
  ]);
}

String? confirmPasswordValidator(String? confirmPassword, String? password) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Confirm Password is required';
  }
  if (confirmPassword != password) {
    return 'Passwords do not match';
  }
  return null; // Validation passed
}

String? newPasswordValidator(String? newPassword, String? confirmPassword) {
  if (newPassword == null || newPassword.isEmpty) {
    return 'New Password is required';
  }
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Confirm Password is required';
  }
  if (newPassword != confirmPassword) {
    return 'Create New Passwords do not match';
  }
  return null; // Validation passed
}

String? Function(String?)? phoneValidator() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    } else if (value.length < 11) {
      return 'Please enter a complete number';
    }
    return null;
  };
}

String? validateMessage(String? value) {
  if (value == null || value.trim().isEmpty) {
    return '';
  }
  return null;
}

String? Function(String?)? requiredValidatorName({String? error}) {
  return (String? value) {
    if (value != null && value.startsWith(' ')) {
      return error ?? 'Name cannot start with a space';
    }
    return RequiredValidator(errorText: error ?? 'This field is required*')
        .call(value);
  };
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    // Automatically add a slash after entering MM
    if (text.length == 2 && !text.contains('/')) {
      return TextEditingValue(
        text: '$text/',
        selection: const TextSelection.collapsed(offset: 3),
      );
    }

    // Prevents additional characters beyond MM/YYYY
    if (text.length > 7) {
      return oldValue;
    }

    return newValue;
  }

  String generateOtp() {
    final random = Random();
    String otp = '';
    for (int i = 0; i < 6; i++) {
      otp += random.nextInt(10).toString();
    }
    return otp;
  }
}
