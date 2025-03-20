import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jewels_airport_transfers/Widgets/form_validation/form_validation.dart';

import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/auth_controller/auth_controller.dart';
import '../text_field/text_input_field.dart';

class PaymentTabContent extends StatelessWidget {
  PaymentTabContent({
    super.key,
  });

  final authCtrl = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              bankDetails,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                TextInputFieldWidget(
                  hintText: accountHolder,
                  title: name1,
                  isLableRequired: true,
                  cursorsColor: kBlackColor,
                  controller: authCtrl.accountNameController.value,
                  validators: requiredValidator(),
                ),
                const Gap(10),
                TextInputFieldWidget(
                  hintText: bankHolder,
                  title: bankName,
                  isLableRequired: true,
                  cursorsColor: kBlackColor,
                  controller: authCtrl.bankNameController.value,
                  validators: requiredValidator(),
                ),
                const Gap(10),
                TextInputFieldWidget(
                  hintText: idcard,
                  title: sortCode,
                  isLableRequired: true,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.emailAddress,
                  controller: authCtrl.sortCodeController.value,
                  validators: requiredValidator(),
                ),
                const Gap(10),
                TextInputFieldWidget(
                  hintText: digitsAccountNumber,
                  title: account1,
                  isLableRequired: true,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.phone,
                  controller: authCtrl.accountNumberController.value,
                  validators: requiredValidator(),
                ),
                const Gap(30),
                Align(
                  alignment: Alignment.center,
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        unfocusKeyboard(context);
                        authCtrl.tabController.animateTo(2);
                        authCtrl.update();
                      }
                    },
                    child: const Text(
                      next,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
