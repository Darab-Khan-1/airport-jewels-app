import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
            // Handle back action here
          },
        ),
        title: Text(
          driverInstructions,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: kWhiteColor, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9, // Adjust width
                child: Card(
                  elevation: 4.0, // Adds shadow to the card
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        15.0), // Add padding inside the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Use Row to display icon and text horizontally
                        Row(
                          children: [
                            const Icon(
                              Icons.radio_button_checked,
                              size: 30,
                              color: kgreenColor,
                            ),
                            const Gap(10), // Add space between icon and text
                            Text(
                              pickUp,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: kBlackColor),
                            ),
                          ],
                        ),
                        // Add vertical space
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display vertically rotated text (doted)
                            RotatedBox(
                              quarterTurns: 3, // Rotates the text vertically
                              child: Text(
                                lahorePakistanIslambad,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: kBlackColor),
                              ),
                            ), // Add space
                          ],
                        ), // Add vertical space
                        // Use Row for the drop-off icon and text as well
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 35,
                              color: kRedColor,
                            ),
                            const Gap(10), // Add space between icon and text
                            Text(
                              dropOff,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: kBlackColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(10), // Add space after the card
              // Display dropOff text separately below the card
              Padding(
                padding: const EdgeInsets.only(
                    left: 10), // Adjust the value as needed
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    distance,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: kBlackColor),
                  ),
                ),
              ),
              const Gap(10),
              Card(
                margin: const EdgeInsets.all(16),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Journey Date and Time
                      Text(
                        journey1,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: kBlackColor),
                      ),
                      const Gap(10),

                      // Vehicle and Language
                      Text(
                        vehicleAndLanguage,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: kBlackColor),
                      ),
                      Row(
                        children: [
                          Text(
                            vehicle1,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kBlackColor),
                          ),
                          const Gap(10),
                          Text(
                            saloon,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kGradient2),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            language,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kBlackColor),
                          ),
                          const Gap(10),
                          Text(
                            english,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kGradient2),
                          ),
                        ],
                      ),
                      const Gap(30),

                      // Passenger Information
                      Text(
                        passengerInformation,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: kBlackColor),
                      ),
                      Row(
                        children: [
                          Text(
                            name,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kBlackColor),
                          ),
                          const Gap(10),
                          Text(
                            jeoDhon,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kGradient2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            mobileNumber,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kBlackColor),
                          ),
                          const Gap(10),
                          Text(
                            num1,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kGradient2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            noOfPassenger,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kBlackColor),
                          ),
                          const Gap(10),
                          Text(
                            num,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kGradient2),
                          ),
                        ],
                      ),
                      const Gap(30),

                      // Services Information
                      Text(
                        serviceInformation,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: kBlackColor),
                      ),
                      Row(
                        children: [
                          Text(
                            flight,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kBlackColor),
                          ),
                          const Gap(10),
                          Text(
                            jeoDhon,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kGradient2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            arriving,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kBlackColor),
                          ),
                          const Gap(10),
                          Text(
                            num1,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kGradient2),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            meetGreet,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kBlackColor),
                          ),
                          const Gap(10),
                          Text(
                            num,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kGradient2),
                          ),
                        ],
                      ),
                      const Gap(20), // Final Gap
                      Row(
                        children: [
                          Text(
                            fareAccepted,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: kBlackColor),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            dollars,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: instructionForAllJourney,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: kBlackColor),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer(),
                                text: linkpage,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: kBlueColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
