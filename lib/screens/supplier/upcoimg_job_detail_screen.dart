import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/Widgets/buttons/leading_button.dart';
import 'package:jewels_airport_transfers/screens/supplier/job_page.dart';
import '../../Widgets/buttons/custom_widgets.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

class UpcomingJobDetailScreen extends StatelessWidget {
  const UpcomingJobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingButton(),
        title: const Text(
          instructions,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.directions_car,
                              text: "Saloon",
                              textColor: kBlackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.edit_note,
                              text: "Ref:",
                              data: "09893758762",
                              textColor: kBlackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Text(
                        "Vehicle Description: ",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      Text(
                        "This vehicle can accommodate up to 4 passengers travelling with 4 x 23 kg's suitcases.",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Gap(10),
                      buildIconTextRow(
                        icon: Icons.person,
                        iconColor: kBlackColor,
                        text: "Passenger:",
                        data: "3",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(10),
                      buildIconTextRow(
                        icon: Icons.luggage,
                        iconColor: kPurpleColor,
                        text: "Luggage:",
                        data: "Suitcase",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(10),
                      buildIconTextRow(
                        icon: Icons.radio_button_checked,
                        iconColor: kgreenColor,
                        text: "Pickup:",
                        data: "Location A",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      buildIconTextRow(
                        icon: Icons.location_on,
                        iconColor: kRedColor,
                        text: "Drop-off:",
                        data: "Location B",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.timeline,
                              text: "Approx:",
                              data: "25 Miles",
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.handshake,
                              text: "Meet & Greet:",
                              data: "Yes",
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.calendar_today,
                              text: "Date:",
                              data: "17 July 2025",
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.access_time,
                              text: "Time:",
                              data: "10:00 AM",
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10), // Add space after the card
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Passenger Information:",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 18,
                            ),
                      ),
                      const Gap(10),
                      buildTextRow(
                        text: "Name:",
                        data: "Passenger Name",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(5),
                      buildTextRow(
                        text: "Mobile:",
                        data: "0000-0000000",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service Information:",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 18,
                            ),
                      ),
                      buildIconTextRow(
                        icon: Icons.flight_takeoff,
                        text: "BE4783",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      buildIconTextRow(
                        icon: Icons.flight_land_outlined,
                        text: "Lahore",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Text(
                            "Fare Accepted:",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Gap(10),
                          const Text(
                            "£76.00",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: kgreenColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_box,
                      color: kPrimaryColor,
                    ),
                    const Gap(8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text:
                              "By submitting your quote, you are accepting the Jewels Airport Transfers ",
                          style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 14.0,
                          ),
                          children: [
                            TextSpan(
                              text: "terms and conditions",
                              style: TextStyle(
                                color: kPrimaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildChip('Alarm'),
        _buildChip('On Route'),
        _buildChip('POB'),
        _buildChip('Dropped'),
        _buildChip('Call Office'),
        GestureDetector(
            onTap: () {
              Get.to(() => const JobPage());
            },
            child: _buildChip('Push Job to Driver')),
      ],
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: kWhiteColor,
      side: BorderSide(color: kMainColor),
    );
  }
}
