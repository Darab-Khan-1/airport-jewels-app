import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

class ViewDetailScreen extends StatelessWidget {
  const ViewDetailScreen({super.key});

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
          instructions,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: kWhiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
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
                            Gap(10), // Add space between icon and text
                            Text(
                              pickup,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                doted,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: kGradient2,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                            ), // Add space
                          ],
                        ),
                        // Add vertical space
                        // Use Row for the drop-off icon and text as well
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 30,
                              color: kRedColor,
                            ),
                            Gap(10), // Add space between icon and text
                            Text(
                              dropOff,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Gap(10), // Add space after the card
              // Display dropOff text separately below the card
              Padding(
                padding: const EdgeInsets.only(
                    left: 10), // Adjust the value as needed
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    distance,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: kBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Gap(10),
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
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                      ),
                      Gap(10),

                      // Vehicle and Language
                      Text(
                        vehicle,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                      ),
                      Row(
                        children: [
                          Text(
                            vehicle1,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                          Gap(10),
                          Text(
                            saloon,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kGradient2,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            language,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                          Gap(10),
                          Text(
                            english,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kGradient2,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      Gap(20),

                      // Passenger Information
                      Text(
                        passengerInformation,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                      ),
                      Row(
                        children: [
                          Text(
                            name,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                          Gap(10),
                          Text(
                            johe,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kGradient2,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            mobileNumber,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                          Gap(10),
                          Text(
                            num1,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kGradient2,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            passenger,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                          Gap(10),
                          Text(
                            num,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kGradient2,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      Gap(30),

                      // Services Information
                      Text(
                        services,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                      ),
                      Row(
                        children: [
                          Text(
                            flight,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                          Gap(10),
                          Text(
                            johe,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kGradient2,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            arriving,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                          Gap(10),
                          Text(
                            num1,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kGradient2,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            meetGreet,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                          Gap(10),
                          Text(
                            num,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kGradient2,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Final Gap
                      Row(
                        children: [
                          Text(
                            fareAccepted,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                          ),
                          Gap(10),
                          Text(
                            dollars,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      Gap(10),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: instructions1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: kBlackColor),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer(),
                                text: move,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      border: Border.all(color: kBlueColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      alarm,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: kBlackColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      border: Border.all(color: kBlueColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      bop,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: kBlackColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      border: Border.all(color: kBlueColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      droped,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: kBlackColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                    ),
                  ),
                ],
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      border: Border.all(color: kBlueColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      calloffice,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: kBlackColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      border: Border.all(color: kBlueColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      pushjob,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: kBlackColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
