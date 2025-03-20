import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/Widgets/form_validation/form_validation.dart';
import 'package:jewels_airport_transfers/constants/enum.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/auth_controller/auth_controller.dart';
import '../drop_down_field/drop_down_field.dart';
import '../text_field/text_input_field.dart';

class AccountTabContent extends StatelessWidget {
  AccountTabContent({
    super.key,
  });

  final authCtrl = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
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
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInputFieldWidget(
                  hintText: "Title",
                  isLableRequired: true,
                  title: titleName,
                  cursorsColor: kBlackColor,
                  controller: authCtrl.titleController.value,
                  validators: requiredValidator(),
                ),
                const Gap(10),
                TextInputFieldWidget(
                  hintText: "Member Name",
                  isLableRequired: true,
                  title: memberName,
                  cursorsColor: kBlackColor,
                  controller: authCtrl.memberTypeController.value,
                  validators: requiredValidator(),
                ),
                const Gap(10),
                Row(
                  children: [
                    Flexible(
                      child: TextInputFieldWidget(
                        hintText: "First Name",
                        isLableRequired: true,
                        title: firstName,
                        cursorsColor: kBlackColor,
                        controller: authCtrl.firstNameController.value,
                        validators: requiredValidator(),
                      ),
                    ),
                    const Gap(10),
                    Flexible(
                      child: TextInputFieldWidget(
                        hintText: "Last Name",
                        isLableRequired: true,
                        title: lastName,
                        cursorsColor: kBlackColor,
                        controller: authCtrl.lastNameController.value,
                        validators: requiredValidator(),
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                TextInputFieldWidget(
                  hintText: businessName,
                  title: businessName,
                  isLableRequired: true,
                  cursorsColor: kBlackColor,
                  validators: requiredValidator(),
                ),
                const Gap(10),
                TextInputFieldWidget(
                  hintText: enterEmail,
                  title: email,
                  isLableRequired: true,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: authCtrl.emailController.value,
                  validators: emailValidator().call,
                ),
                const Gap(10),
                TextInputFieldWidget(
                  hintText: enterPassword,
                  title: password,
                  isLableRequired: true,
                  cursorsColor: kBlackColor,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputType: TextInputType.phone,
                  controller: authCtrl.passwordController.value,
                  validators: passwordValidator().call,
                ),
                const Gap(10),
                TextInputFieldWidget(
                  hintText: enterMobileNumber,
                  title: mobileNumber1,
                  isLableRequired: true,
                  maxLength: 11,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: authCtrl.mobileNumberController.value,
                  validators: phoneValidator(),
                ),
                const Gap(10),
                RichText(
                  text: TextSpan(
                    text: pleaseFillForm,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: kBlackColor, fontWeight: FontWeight.normal),
                    children: [
                      TextSpan(
                        text: saleJewelsAirport,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: kMainColor,
                            ),
                      ),
                      TextSpan(
                        text: alongWithCopies,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: kBlackColor, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      unfocusKeyboard(context);
                      authCtrl.tabController.animateTo(1);
                      authCtrl.update();
                    }
                  },
                  child: const Text(next),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
