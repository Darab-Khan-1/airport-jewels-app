import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/screens/otp_screen.dart';
import '../Widgets/buttons/k_elevated_button.dart';
import '../constants/color.dart';
import '../constants/string.dart';
import '../controlller/supplier_controller.dart';
import '../custom_bg_screen.dart';
import '../gen/assets.gen.dart';
import 'package:country_picker/country_picker.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SupplierScreenState createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  String selectedCountryCode = "+1"; // Default country code

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
                  horizontal: 20,
                  vertical: 10), // Add padding to left and right
              child: Image.asset(
                Assets.images.airplaneLogo.path,
              ),
            ),
            Text(
              welcomeBack,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    decorationColor: kWhiteColor,
                  ),
            ),
            const Gap(2),
            Text(
              signIn,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    decorationColor: kWhiteColor,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const Gap(100),
            // Container for country picker and phone input
            Container(
              padding: const EdgeInsets.symmetric(vertical: 1),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: kTransparent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: kWhiteColor),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (Country country) {
                          setState(() {
                            selectedCountryCode = "+${country.phoneCode}";
                          });
                          if (kDebugMode) {
                            print('Selected country: ${country.name}');
                          }
                        },
                        countryListTheme: const CountryListThemeData(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                          inputDecoration: InputDecoration(
                            labelText: search,
                            hintText: start,
                            border: InputBorder.none,
                          ),
                          flagSize: 25,
                          textStyle: TextStyle(
                            fontSize: 12,
                            color: kBlackColor,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Gap(8),
                        Text(
                          selectedCountryCode,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: kWhiteColor),
                        ),
                        const Icon(Icons.arrow_drop_down, color: kGreyColor),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Text(
                    slash,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          decorationColor: kWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                  ),
                  const Gap(10),
                  const Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: mobileNumber1,
                        hintStyle: TextStyle(
                          color: kWhiteColor,
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      style: TextStyle(color: kWhiteColor),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Obx(() => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Adding padding to move the checkbox slightly to the left
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 35.0), // Adjust the value as needed
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
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                    // Using a Spacer to move the text to the right

                    Text(
                      keepLogin,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            decorationColor: kWhiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                )),
            const Gap(15),
            Text(
              digits,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    decorationColor: kWhiteColor,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const Gap(40),
            Center(
              child: SizedBox(
                width: 300,
                child: KElevatedButton(
                  onPressed: () {
                    Get.to(() => const OTPScreen());
                  },
                  text: next,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
