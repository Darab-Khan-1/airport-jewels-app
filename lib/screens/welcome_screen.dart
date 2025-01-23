import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/screens/driver/driver_upcoming_screen.dart';
import 'package:jewels_airport_transfers/screens/registration_form_screen/registrartion_form_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier_screen.dart';
import '../Widgets/buttons/k_elevated_button.dart';
import '../constants/color.dart';
import '../constants/string.dart';
import '../custom_bg_screen.dart';
import '../gen/assets.gen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBgScreen(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(40), // Adds space at the top
            Image.asset(
              Assets.images.jewelsLogo1.path,
            ),
            const Gap(10),
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
                  decorationColor: kWhiteColor, fontWeight: FontWeight.w400),
            ),
            const Gap(140),

            Text(
              logIn,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  decorationColor: kWhiteColor, fontWeight: FontWeight.bold),
            ),

            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centers the buttons horizontally.
                children: [
                  Expanded(
                    child: KElevatedButtons(
                      onPressed: () {
                        Get.to(() => const DriverUpcomingScreen());
                      },
                      text: driver,
                    ),
                  ),
                  const Gap(20),
                  // Adds space between the buttons.
                  Expanded(
                    child: SocialButton(
                      onPressed: () {
                        Get.to(() => const SupplierScreen());
                      },
                      text: supplier,
                      imagePath: '',
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Center(
              child: RichText(
                text: TextSpan(
                  text: become,
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: click,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: kMainColor,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to the next page
                          Get.to(() => const RegistrationFormScreen());
                        },
                    ),
                  ],
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
