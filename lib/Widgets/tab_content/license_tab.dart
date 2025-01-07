import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/registration_form_controller.dart';
import '../buttons/k_elevated_button.dart';
import '../custom_checkbox/custom_checkbox.dart';

class LicenseTabContent extends StatelessWidget {
  final RegistrationFormController controller;

  const LicenseTabContent({
    required this.controller,
    super.key,
  });

  Widget _buildCheckboxRow(String label) {
    return CustomCheckbox(
      label: label,
      value: false, // Replace with actual state logic
      onChanged: (value) {}, // Implement the checkbox onChanged callback
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerLeft, // Aligns the text to the left
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // Padding for left and right
              child: Text(
                license1, // Replace fleet with the actual string
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const Gap(5),

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
                  style: TextStyle(color: kBlackColor, fontSize: 13),
                ),
                TextSpan(
                  text: along,
                  style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                ),
              ],
            ),
          ),
          const Gap(20),
          RichText(
            text: TextSpan(
              text: form,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: kBlueColor, fontWeight: FontWeight.w400),
            ),
          ),
          const Gap(10),
          // Reusable checkbox row widget
          _buildCheckboxRow(hire),
          const Gap(10),
          _buildCheckboxRow(hire1),
          const Gap(10),
          _buildCheckboxRow(hire2),
          RichText(
            text: TextSpan(
              text: form,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: kBlackColor, fontWeight: FontWeight.w400),
              children: [
                TextSpan(
                  text: sale,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor, fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: along,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Gap(5),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 300,
              height: 45,
              child: KElevatedButton1Transparent(
                onPressed: () {},
                text: next,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
