import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constants/color.dart';
import '../gen/assets.gen.dart';

void snackBarCustom({
  required String title,
  required String message,
  required SnackBarType type, // Enum to differentiate between success and error
}) {
  final Color backgroundColor;
  final IconData iconData;

  // Determine the background color and icon based on the type
  switch (type) {
    case SnackBarType.success:
      backgroundColor = kGradient1;
      iconData = Icons.check_circle;
      break;
    case SnackBarType.error:
      backgroundColor = kRedColor;
      iconData = Icons.error;
      break;
  }

  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: kWhiteColor,
    icon: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: type == SnackBarType.success
          ? SvgPicture.asset(
              "",
              width: 30,
              height: 30,
            )
          : Icon(
              iconData,
              color: kWhiteColor,
              size: 30,
            ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    borderRadius: 12,
    margin: const EdgeInsets.all(10),
    animationDuration: const Duration(milliseconds: 300),
    forwardAnimationCurve: Curves.easeOutBack,
    titleText: Text(
      title,
      style: Get.textTheme.bodyMedium!.copyWith(
        color: kWhiteColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    messageText: Text(
      message,
      style: Get.textTheme.bodySmall!.copyWith(
        color: Colors.white,
      ),
    ),
    mainButton: TextButton(
      onPressed: () => Get.back(),
      style: Theme.of(Get.context!)
          .textButtonTheme
          .style
          ?.copyWith(backgroundColor: WidgetStatePropertyAll(backgroundColor)),
      child: const Icon(
        Icons.close,
        color: Colors.white,
      ),
    ),
  );
}


// Define an enum for message type
enum SnackBarType { success, error }
