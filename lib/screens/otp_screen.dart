import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/color.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import 'package:jewels_airport_transfers/screens/supplier/supplier_home_screen.dart';
import 'package:pinput/pinput.dart';
import '../Widgets/buttons/k_elevated_button.dart';
import '../gen/assets.gen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Image.asset(
                    Assets.images.jewelsLogo1.path,
                  ),

                  Text(
                    otp,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: kBlackColor,
                        ),
                  ),
                  Text(
                    enterVerficationCode,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: kBlackColor),
                  ),

                  const Gap(30),

                  // Pin Input Fields using Pinput
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Pinput(
                      length: 6, // Length of the OTP
                      onChanged: (pin) {}, // Handle change
                      showCursor: true, // Show cursor
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: kBlackColor,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: kBlueColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: didNotReceiveCode,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: kBlackColor),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer(),
                            text: resend,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: kdarkblueColor,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(40),

                  /// add new button

                  Center(
                    child: KElevatedButton(
                      onPressed: () {
                        Get.to(() => const SupplierHomeScreen(
                              isDriver: false,
                            ));
                      },
                      text: (verify),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
