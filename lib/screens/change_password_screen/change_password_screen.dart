import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/color.dart';
import 'package:jewels_airport_transfers/constants/extension.dart';

import '../../Widgets/form_validation/form_validation.dart';
import '../../Widgets/text_field/text_input_field.dart';
import '../../constants/string.dart';
import '../../controlller/auth_controller/auth_controller.dart';
import '../../gen/assets.gen.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(changePassword),
        backgroundColor: kMainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Image.asset(Assets.images.jewelsLogo1.path,
                        width: context.screenWidth / 1.2,
                        height: context.screenHeight / 4),
                  ),
                ),
                const Gap(10),
                Text(
                  currentPassword,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextInputFieldWidget(
                  controller: controller.passwordController.value,
                  hintText: enterCurrentPassword,
                  validators: passwordValidator().call,
                ),
                const Gap(20),
                Text(
                  newPassword,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextInputFieldWidget(
                  controller: controller.newPasswordController.value,
                  hintText: enterNewPassword,
                  validators: (value) => confirmPasswordValidator(
                      value, controller.newPasswordController.value.text),
                ),
                const Gap(20),
                Text(
                  confirmNewPassword,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextInputFieldWidget(
                  controller: controller.newPasswordConfirmController.value,
                  hintText: confirmNewPassword,
                  validators: (value) => confirmPasswordValidator(
                      value, controller.newPasswordController.value.text),
                ),
                const Gap(24),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text(changePassword),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
