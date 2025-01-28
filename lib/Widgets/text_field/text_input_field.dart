import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import '../../constants/color.dart';

// ignore: must_be_immutable
class TextInputFieldWidget extends StatelessWidget {
  TextInputFieldWidget({
    super.key,
    this.lable,
    this.suffixIcon,
    this.prefixIcon,
    this.cursorsColor = kWhiteColor,
    this.isRequired = true,
    this.autoFillHints,
    this.capitalization,
    this.controller,
    this.formatter,
    this.isReadOnly,
    this.maxLines = 1,
    this.obscure,
    this.onChange,
    this.ontap,
    this.textInputType,
    this.validators,
    this.initialValue,
    this.hintText,
    this.autovalidateMode,
    this.maxLength,
    this.isDisabled,
    this.prefixText,
    this.secondPrefixText,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.digitsOnly = false,
    this.isEmail = false,
    this.enable,
    this.isPhoneNo = false,
    this.width = double.infinity,
    this.height = 50.0,
    this.isPasswordNo = false,
    this.filled = false,
    this.isLableRequired = false, this.title,
  });
  String? lable;
  final Widget? suffixIcon, prefixIcon;
  final Iterable<String>? autoFillHints;
  final TextCapitalization? capitalization;
  final List<TextInputFormatter>? formatter;
  final bool? obscure, isReadOnly, isDisabled;
  final bool isRequired, isPhoneNo, isEmail, digitsOnly, isPasswordNo;
  final String? Function(String?)? validators;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Color cursorsColor;
  final int? maxLines;
  final String? hintText, initialValue, prefixText, secondPrefixText;
  final AutovalidateMode? autovalidateMode;
  final int? maxLength;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final Function()? ontap, onEditingComplete;
  final bool? enable;
  final double width;
  final double height;
  final bool? filled;
  final bool? isLableRequired;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(isLableRequired ?? false)
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(8),
        TextFormField(
          initialValue: initialValue,
          autofillHints: autoFillHints,
          textCapitalization: capitalization ?? TextCapitalization.none,
          inputFormatters: formatter,
          obscureText: obscure ?? false,
          readOnly: isReadOnly ?? false,
          validator: validators,
          enabled: enable,
          controller: controller,
          cursorColor: cursorsColor,
          textAlign: TextAlign.start,
          onChanged: onChange,
          obscuringCharacter: "*",
          maxLines: maxLines,
          onTap: ontap,
          mouseCursor: SystemMouseCursors.click,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          maxLength: maxLength,
          keyboardType: textInputType,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: hintText,
              hintStyle: const TextStyle(color: kGradient2),
              labelText: lable,
              prefixIconConstraints: const BoxConstraints(),
              counterText: '',
              prefixText: prefixText,
              prefixIcon: prefixIcon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 0.0),
                      child: prefixIcon,
                    ),
              suffixIcon: suffixIcon,
              suffixIconColor: kWhiteColor),
        ),
      ],
    );
  }
}
