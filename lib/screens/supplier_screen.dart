import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/extension.dart';
import 'package:jewels_airport_transfers/screens/otp_screen.dart';
import '../Widgets/buttons/k_elevated_button.dart';
import '../Widgets/text_field/intl_phone_field.dart';
import '../constants/color.dart';
import '../constants/string.dart';
import '../controlller/supplier_controller.dart';
import '../custom_bg_screen.dart';
import '../gen/assets.gen.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({super.key});

  @override
  _SupplierScreenState createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  final controller = Get.put(SupplierController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return CustomBgScreen(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(5),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5), // Add padding to left and right
              child: Image.asset(Assets.images.jewelsLogo1.path,
                  height: context.screenHeight * 0.5,
                  width: context.screenWidth * 0.7),
            ),
            Text(
              welcomeBack,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: kWhiteColor,
                  ),
            ),
            const Gap(2),
            Text(
              signInToContinue,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const Gap(100),
            // Using IntlPhoneField for phone input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PhoneInputField(
                // initialCountryCode: profileController.countryCode.value.text,
                initialCountryCode: "GB",
                fillColor: kTransparent,
                // labelText: 'Enter Phone',
                // fillColor: lightGreyColor, // Customize the fill color if desired
                readOnly: false,
                // controller: profileController.phoneController.value,
                onChanged: (completeNumber) {
                  if (kDebugMode) {
                    print("Complete phone number: $completeNumber");
                  }
                },
                onCountryChanged: (country) {
                  // profileController.countryCode.value.text = country.dialCode!;
                  log(country.code.toString());
                },
              ),
            ),
            Obx(() => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: SizedBox(
                        height: 20,
                        width: 12,
                        child: Transform.scale(
                          scale: 0.8,
                          child: Checkbox(
                            checkColor: Colors.black,
                            value: controller.isChecked.value,
                            onChanged: (value) => controller.toggleCheckbox(),
                            activeColor: kWhiteColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            side: const BorderSide(
                              color: kWhiteColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                    Text(
                      keepLogin,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: kWhiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                )),
            const Gap(15),
            Text(
              digits,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const Gap(40),
            Center(
              child: KElevatedButton(
                onPressed: () {
                  Get.to(() => const OTPScreen());
                },
                text: next,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
