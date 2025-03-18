import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jewels_airport_transfers/Widgets/custom_alert_dialouge/custom_alert_dialouge_screen.dart';
import 'package:jewels_airport_transfers/Widgets/text_field/text_input_field.dart';
import 'package:jewels_airport_transfers/constants/color.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import 'package:jewels_airport_transfers/controlller/add_drvier_controller/add_driver_controller.dart';

import '../../Widgets/form_validation/form_validation.dart';
import 'job_page.dart';

class AddDriverScreen extends StatelessWidget {
  AddDriverScreen({super.key});
  final AddDriverController controller = Get.put(AddDriverController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
            // Handle back action here
          },
        ),
        title: const Text(
          supplier,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(30),
                Text(
                  firstName,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(5),
                TextInputFieldWidget(
                  controller: controller.firstNameController.value,
                  hintText: enterFirstName,
                  cursorsColor: kBlackColor,
                  lable: null,
                  validators: requiredValidator(
                      error: "First Name Required"), // Add this line
                ),
                const Gap(10),
                Text(
                  lastName,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(5),
                TextInputFieldWidget(
                  controller: controller.lastNameController.value,
                  hintText: enterLastName,
                  cursorsColor: kBlackColor,
                  lable: null,
                  validators: requiredValidator(error: "Last Name Required"),
                ),
                const Gap(10),
                Text(
                  email,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(5),
                TextInputFieldWidget(
                  controller: controller.emailController.value,
                  hintText: enterEmail,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.emailAddress,
                  validators: emailValidator().call,
                ),
                const Gap(10),
                Text(
                  mobileNumber1,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(5),
                TextInputFieldWidget(
                  controller: controller.mobileController.value,
                  hintText: mobileNumber1,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.phone,
                  validators: phoneValidator(),
                ),
                const Gap(30),
                FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      unfocusKeyboard(context);

                      // Show loading indicator
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      );

                      await controller.addDriver(context);

                      if (context.mounted) {
                        Navigator.pop(context);

                        await showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const CustomAlertDialogScreen(),
                        );

                        Get.to(() => JobScreen());
                      }
                    }
                  },
                  child: const Text(addDriver),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
