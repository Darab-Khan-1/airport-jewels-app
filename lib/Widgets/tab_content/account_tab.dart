import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/registration_form_controller.dart';
import '../buttons/k_elevated_button.dart';
import '../text_field/text_input_field.dart';

class AccountTabContent extends StatelessWidget {
  final RegistrationFormController controller;

  const AccountTabContent({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft, // Aligns the text to the left
            child: Text(
              account,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name1,
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
                  hintText: name1,
                  cursorsColor: kBlackColor,
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
                  hintText: mobileNumber2,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.phone,
                ),
              ),
              const Gap(30),
              RichText(
                text: const TextSpan(
                  text: form,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  children: [
                    TextSpan(
                      text: sale,
                      style: TextStyle(color: Colors.blue, fontSize: 13),
                    ),
                    TextSpan(
                      text: along,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  height: 40,
                  child: KElevatedButton1Transparent(
                    onPressed: () {
                      // Add driver logic here
                    },
                    text: next,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
