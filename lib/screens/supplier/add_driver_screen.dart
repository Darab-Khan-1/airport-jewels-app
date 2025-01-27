import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/Widgets/buttons/k_elevated_button.dart';
import 'package:jewels_airport_transfers/Widgets/custom_alert_dialouge/custom_alert_dialouge_screen.dart';
import 'package:jewels_airport_transfers/Widgets/text_field/text_input_field.dart';
import 'package:jewels_airport_transfers/constants/color.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import 'package:jewels_airport_transfers/screens/supplier/driver_screen.dart';

class AddDriverScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  AddDriverScreen({super.key});

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
        title: Text(
          supplier,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(10),
              TextInputFieldWidget(
                controller: nameController,
                hintText: enterName,
                cursorsColor: kBlackColor,
                lable: null,
              ),
              const Gap(20),
              Text(
                email,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(8),
              TextInputFieldWidget(
                controller: emailController,
                hintText: enterEmail,
                cursorsColor: kBlackColor,
                textInputType: TextInputType.emailAddress,
              ),
              const Gap(20),
              Text(
                mobileNumber1,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(8),
              TextInputFieldWidget(
                controller: mobileController,
                hintText: mobileNumber1,
                cursorsColor: kBlackColor,
                textInputType: TextInputType.phone,
              ),
              const Gap(30),
              FilledButton(
                onPressed: () {
                  if (kDebugMode) {
                    print("Name: ${nameController.text}");
                  }
                  if (kDebugMode) {
                    print("Email: ${emailController.text}");
                  }
                  if (kDebugMode) {
                    print("Mobile: ${mobileController.text}");
                  }
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const CustomAlertDialogScreen());
                },
                child: const Text(addDriver),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
