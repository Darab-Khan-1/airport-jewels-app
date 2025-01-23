import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../buttons/k_elevated_button.dart';
import '../custom_checkbox/custom_checkbox.dart';

class FleetTabContent extends StatelessWidget {
  const FleetTabContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
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

          _buildCustomCheckbox(estate),

          _buildCustomCheckbox(excutive),

          _buildCustomCheckbox(carrier),

          _buildCustomCheckbox(mervian),

          _buildCustomCheckbox(excutive1),
          Align(
            alignment: Alignment.center,
            child: KElevatedButton1(
              onPressed: () {
                // Add driver logic here
              },
              text: register,
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
