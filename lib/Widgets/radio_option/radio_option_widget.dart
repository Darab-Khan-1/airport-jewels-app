import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';
import '../../controlller/auth_controller/auth_controller.dart';

class RadioOptionWidget extends StatelessWidget {
  final String value;
  final AuthController authCtrl;

  const RadioOptionWidget({
    Key? key,
    required this.value,
    required this.authCtrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RadioListTile<String>(
        title: Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        value: value,
        activeColor: kMainColor,
        groupValue: authCtrl.selectedOption.value, // ✅ Corrected Reference
        onChanged: (newValue) => authCtrl.updateSelectedOption(newValue!),
      ),
    );
  }
}
