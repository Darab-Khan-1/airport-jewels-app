import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/auth_controller/auth_controller.dart';
import '../buttons/k_elevated_button.dart';
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
          Gap(10),
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

  Widget _buildCustomCheckbox() {
    return Obx(() => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: authCtrl.allCars.value.data?.length,
      itemBuilder: (context, index) {
        var item = authCtrl.allCars.value.data![index];
        return CustomCheckbox(
          onChanged: (value) {
            item.isSelected = value;
            authCtrl.allCars.refresh();
            authCtrl.update();
          }, label: item.carName ?? '',
          value: item.isSelected ?? false,
        );
      },
    ),
    );
  }
}
