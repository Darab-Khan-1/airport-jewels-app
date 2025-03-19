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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
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
                validators: phoneValidator(),
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: enterLandlineNumber,
                title: landlineNumber,
                isLableRequired: true,
                cursorsColor: kBlackColor,
                textInputType: TextInputType.phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validators: phoneValidator(),
              ),
              const Gap(10),
              _buildSelectionOptions(context),
              Gap(10),
              _buildCountryDropDown(),
              Gap(10),
              _buildPortDropDown(),
              Gap(10),
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
                  // Add driver logic here
                },
                child: Text(next),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// build all countries dropdown
  Widget _buildCountryDropDown() {
    return Obx(
      () => DropdownFilter(
        title: "Select Country",
        value: authCtrl.countryController.value.text,
        items: authCtrl.allCountries.value.data
                ?.map((e) => e.countryName ?? '')
                .toList() ??
            [''],
        validator: requiredValidator(),
        onChanged: (va) {},
      ),
    );
  }

  Widget _buildPortDropDown() {
    return MultiSelectDropdownFormField(
      title: "Select Ports",
      items:
          authCtrl.allPorts.value.data?.map((e) => e.postcode ?? '').toList() ??
              [''],
      onChanged: (va) {},
      selectedItems: authCtrl.selectedPorts,
    );
  }

  /// Builds the Email/Mobile selection options
  Widget _buildSelectionOptions(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          _buildRadioOption(context, UserRole.DRIVER.name.toUpperCase()),
          _buildRadioOption(context, UserRole.SUPPLIER.name.toUpperCase()),
        ],
      ),
    );
  }

  /// Reusable method for RadioListTile
  Widget _buildRadioOption(BuildContext context, String value) {
    return Flexible(
      child: RadioListTile<String>(
        title: Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
        ),
        value: value,
        activeColor: kMainColor,
        groupValue: authCtrl.selectedRole.value,
        onChanged: (newValue) => authCtrl.selectedRole.value = newValue!,
      ),
    );
  }
}
