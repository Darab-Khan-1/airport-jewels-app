import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/Widgets/buttons/k_elevated_button.dart';
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
        backgroundColor: kBlueColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
            // Handle back action here
          },
        ),
        title: const Text(
          supplier1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kWhiteColor,
            fontSize: 19,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name1,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(10),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextInputFieldWidget(
                  controller: nameController,
                  hintText: name2,
                  cursorsColor: kBlackColor,
                  lable: null,
                ),
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
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextInputFieldWidget(
                  controller: emailController,
                  hintText: email2,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.emailAddress,
                ),
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
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextInputFieldWidget(
                  controller: mobileController,
                  hintText: mobileNumber1,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.phone,
                ),
              ),
              const Gap(30),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 290,
                    height: 50,
                    child: KElevatedButton2Transparent(
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
                        Get.to(() => DriverScreen());
                      },
                      text: adddriver,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
