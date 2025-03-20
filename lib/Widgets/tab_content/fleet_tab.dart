import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/screens/welcome_screen.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/auth_controller/auth_controller.dart';

import '../custom_checkbox/custom_checkbox.dart';

class FleetTabContent extends StatelessWidget {
  FleetTabContent({
    super.key,
  });

  final authCtrl = Get.find<AuthController>();

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
              fleetDetails,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const Gap(5),
          RichText(
            text: TextSpan(
              text: pleaseFillForm,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: kBlackColor, fontWeight: FontWeight.w400),
              children: [
                TextSpan(
                  text: saleJewelsAirport,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor, fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: alongWithCopies,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Gap(5),
          _buildCustomCheckbox(),
          const Gap(10),
          Align(
            alignment: Alignment.center,
            child: FilledButton(
              onPressed: () {
                authCtrl.registerUser(context);
                Get.to(() => WelcomeScreen());
              },
              child: const Text(register),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomCheckbox() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: authCtrl.allCars.value.data?.length ?? 0, // Handle null case
        itemBuilder: (context, index) {
          var item = authCtrl.allCars.value.data?[index]; // Null-safe access
          if (item == null) return const SizedBox();
          return CustomCheckbox(
            onChanged: (value) {
              /// Update the selected value and reset the list
              authCtrl.updateSelectedCar(item);
            },
            label: item.carName ?? '',
            value: item.isSelected ?? false,
          );
        },
      ),
    );
  }
}
