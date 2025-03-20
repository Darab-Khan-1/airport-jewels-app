import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

import '../../controlller/auth_controller/auth_controller.dart';
import '../radio_option/radio_option_widget.dart';

class LicenseTabContent extends StatelessWidget {
  LicenseTabContent({super.key});

  final authCtrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              license,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
          ),
          const Gap(5),
          RichText(
            text: const TextSpan(
              text: pleaseFillForm, // Null check
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
              children: [
                TextSpan(
                  text: saleJewelsAirport, // Null check
                  style: TextStyle(color: kBlackColor, fontSize: 13),
                ),
                TextSpan(
                  text: alongWithCopies, // Null check
                  style: TextStyle(color: kBlackColor, fontSize: 13),
                ),
              ],
            ),
          ),
          const Gap(10),
          RichText(
            text: TextSpan(
              text: pleaseFillForm,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: kBlueColor,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          const Gap(2),
          _buildSelectionOptions(),
          const Gap(10),
          RichText(
            text: TextSpan(
              text: pleaseFillForm,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: kBlackColor,
                    fontWeight: FontWeight.w400,
                  ),
              children: [
                TextSpan(
                  text: saleJewelsAirport,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: kBlackColor,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                TextSpan(
                  text: alongWithCopies,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: kBlackColor,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
          const Gap(15),
          Align(
            alignment: Alignment.center,
            child: FilledButton(
              onPressed: () {
                authCtrl.tabController.animateTo(3); // Null check
                authCtrl.update();
              },
              child: const Text(next),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionOptions() {
    return Column(
      children: [
        RadioOptionWidget(value: privateHireDriver, authCtrl: authCtrl),
        RadioOptionWidget(
            value: privateHireHackneyCarriage, authCtrl: authCtrl),
      ],
    );
  }
}
