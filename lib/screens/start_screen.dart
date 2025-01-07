import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/extension.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import 'package:jewels_airport_transfers/screens/welcome_screen.dart';

import '../Widgets/buttons/k_elevated_button.dart';
import '../constants/color.dart';
import '../custom_bg_screen.dart';
import '../gen/assets.gen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // Uncomment the next line to navigate after a delay
      // Get.offAll(() => LoginScreen());
    });

    return CustomBgScreen(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(40), // Adds space at the top
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10), // Add padding to left and right
              child: Image.asset(
                Assets.images.airplaneLogo.path,

                // Correct usage of AssetImage
                // Set a width to control size if necessary
              ),
            ),
            Text(
              appName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    decorationColor: kWhiteColor,
                  ),
            ),
            const Gap(130),
            Text(
              becomeDriver,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  decorationColor: kWhiteColor, fontWeight: FontWeight.w500),
            ),
            const Gap(10),
            Text(
              journey,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  decorationColor: kWhiteColor, fontWeight: FontWeight.w400),
            ),
            const Gap(10),
            Center(
              child: SizedBox(
                width: context.screenWidth * 0.6,
                child: KElevatedButton(
                  onPressed: () {
                    Get.to(() => const WelcomeScreen());
                  },
                  text: getStarted,
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
