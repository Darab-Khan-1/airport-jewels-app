import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/registration_form_controller.dart';
import '../buttons/k_elevated_button.dart';
import '../custom_checkbox/custom_checkbox.dart';

class FleetTabContent extends StatelessWidget {
  final RegistrationFormController controller;

  const FleetTabContent({
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
            alignment: Alignment.centerLeft,
            child: Text(
              fleet,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),

          const Gap(5),

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

          // Reusable checkbox row widget
          _buildCustomCheckbox(sallon),
          const Gap(15),
          _buildCustomCheckbox(estate),
          const Gap(5),
          _buildCustomCheckbox(excutive),
          const Gap(5),
          _buildCustomCheckbox(carrier),
          const Gap(5),
          _buildCustomCheckbox(mervian),
          const Gap(5),
          _buildCustomCheckbox(excutive1),
          const Gap(5),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 300,
              height: 45,
              child: KElevatedButton1Transparent(
                onPressed: () {
                  // Add driver logic here
                },
                text: register,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomCheckbox(String label) {
    return CustomCheckbox(
      label: label,
      value: false, // Replace with actual value if needed
      onChanged: (bool? value) {
        // Handle checkbox state change
      },
    );
  }
}
