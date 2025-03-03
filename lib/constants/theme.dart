import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: kbackgroundColor,
      useMaterial3: true,
      fontFamily: null, // Removing any custom font
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: kMainColor,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          textStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w700,),
          minimumSize: const Size(double.infinity, 40),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: kWhiteColor,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          textStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w500, color: kBlueColor),
          minimumSize: const Size(double.infinity, 40),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          textStyle: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.w700, color: kWhiteColor),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: kPrimaryColor),
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: kBlackColor,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: kWhiteColor,
        hourMinuteTextColor: kBlackColor,
        dayPeriodTextColor: kBlackColor,
        dialHandColor: kPrimaryColor,
        dialBackgroundColor: kWhiteColor,
        entryModeIconColor: kPrimaryColor,
        dayPeriodBorderSide: BorderSide(color: kPrimaryColor),
        dayPeriodShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        dayPeriodTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: kBlackColor,
              fontWeight: FontWeight.w700,
            ),
        confirmButtonStyle: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          textStyle: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.w700, color: kWhiteColor),
        ),
        timeSelectorSeparatorColor:
            WidgetStatePropertyAll<Color>(kPrimaryColor),
        timeSelectorSeparatorTextStyle: WidgetStatePropertyAll<TextStyle>(
          Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: kBlackColor,
                fontWeight: FontWeight.w700,
              ),
        ),
        hourMinuteTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: kBlackColor,
              fontWeight: FontWeight.w700,
            ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: kTransparent,
        border: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputActiveBorder,
        errorBorder: outlineInputBorder,
        iconColor: kWhiteColor,
        filled: true,
        prefixStyle: TextStyle(
          color: kBlackColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          color: kWhiteColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        errorMaxLines: 3,
        errorStyle: const TextStyle(
          color: kErrorColor,
          fontSize: 10,
          fontWeight: FontWeight.normal,
        ),
        labelStyle: const TextStyle(
          color: kMainColor,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: kMainColor,
        centerTitle: true,
        elevation: 2,
        titleTextStyle: const TextStyle(
          color: kWhiteColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(color: kWhiteColor),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: kWhiteColor,
        contentTextStyle: const TextStyle(
          color: kWhiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: kBlackColor,
          fontSize: 26,
          fontWeight: FontWeight.w800,
        ),
        titleMedium: TextStyle(
          color: kBlackColor,
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
        titleSmall: TextStyle(
          color: kBlackColor,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
        bodyLarge: TextStyle(
          color: kBlackColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: kBlackColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          color: kBlackColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: kBlackColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: kBlackColor,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        labelSmall: TextStyle(
          color: kBlackColor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: kBlackColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: kBlackColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

final OutlineInputBorder outlineInputActiveBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide:
  const BorderSide(color: kMainColor, width: 2), // Green border color
);
final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: kMainColor, width: 1));
