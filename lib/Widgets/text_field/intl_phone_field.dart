import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jewels_airport_transfers/constants/color.dart';

class PhoneInputField extends StatelessWidget {
  final String initialCountryCode;
  final String? labelText;
  final bool readOnly;
  final Color fillColor;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final Function(Country)? onCountryChanged;

  const PhoneInputField({
    super.key,
    this.initialCountryCode = 'US',
    this.labelText,
    this.readOnly = false,
    this.fillColor = Colors.grey,
    this.controller,
    required this.onChanged,
    required this.onCountryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        labelText: labelText ?? '',
        hintText: "",
        counterText: '',
      ),
      initialCountryCode: initialCountryCode,
      dropdownIcon: const Icon(
        Icons.arrow_drop_down,
        color: kWhiteColor,
      ),
      dropdownTextStyle:
          Theme.of(context).textTheme.labelSmall!.copyWith(color: kWhiteColor),
      style:
          Theme.of(context).textTheme.labelSmall!.copyWith(color: kWhiteColor),
      onChanged: (phone) {
        phone.isValidNumber();
      },
      validator: (value) {
        if (value == null) {
          return 'Phone number is required';
        }
        return null;
      },
      onCountryChanged: (country) {
        onCountryChanged!(country);
      },
      readOnly: readOnly,
    );
  }
}
