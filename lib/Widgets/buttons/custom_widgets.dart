import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';

Widget buildIconTextRow({
  required IconData icon,
  required String text,
  String? data,
  Color? iconColor,
  required Color textColor,
  required FontWeight fontWeight,
}) {
  return Row(
    children: [
      Icon(icon, size: 20, color: iconColor ?? kBlueColor),
      const Gap(5),
      Text(
          text,
          style: Theme.of(Get.context!).textTheme.labelSmall!.copyWith(
              color: textColor,
            fontWeight: fontWeight,
          )
      ),
      if(data != null)...[
        const Gap(5),
        Expanded(
          child: Text(
            data,
            style: Theme.of(Get.context!).textTheme.bodyMedium
          ),
        ),
      ]
    ],
  );
}
Widget buildTextRow({
  required String text,
  String? data,
  required Color textColor,
  required FontWeight fontWeight,
}) {
  return Row(
    children: [
      Text(
          text,
          style: Theme.of(Get.context!).textTheme.labelSmall!.copyWith(
              color: textColor
          )
      ),
        Expanded(
          child: Text(
            data ?? '',
            style: Theme.of(Get.context!).textTheme.bodyMedium
          ),
        ),

    ],
  );
}