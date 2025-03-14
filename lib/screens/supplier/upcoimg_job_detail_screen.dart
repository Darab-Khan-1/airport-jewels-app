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
          driverInstructions,
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
                              text: saloon,
                              textColor: kBlackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.edit_note,
                              text: refrence,
                              data: data,
                              textColor: kBlackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Text(
                        vehicleDescription,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      Text(
                        vehicleCanAccomodate,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Gap(10),
                      buildIconTextRow(
                        icon: Icons.person,
                        iconColor: kBlackColor,
                        text: passenger,
                        data: passengerData,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      buildIconTextRow(
                        icon: Icons.luggage,
                        iconColor: kPurpleColor,
                        text: lauggage,
                        data: lauggageType,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      buildIconTextRow(
                        icon: Icons.radio_button_checked,
                        iconColor: kgreenColor,
                        text: pickUp,
                        data: locationA,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      buildIconTextRow(
                        icon: Icons.location_on,
                        iconColor: kRedColor,
                        text: dropOff,
                        data: locationB,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.timeline,
                              text: approximate,
                              data: miles,
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.handshake,
                              text: meetAndGreet,
                              data: yes,
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
                              text: date,
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.access_time,
                              text: time,
                              data: timeHours,
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
                        passengerInformation,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 18,
                            ),
                      ),
                      const Gap(10),
                      buildTextRow(
                        text: name,
                        data: passenegerName,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(5),
                      buildTextRow(
                        text: mobile,
                        data: mobileDigits,
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
                        serviceInformation,
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
                        text: lahore,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Text(
                            fareAccepted,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Gap(10),
                          const Text(
                            dollars,
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
                          text: bySubmitingYourQuote,
                          style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 14.0,
                          ),
                          children: [
                            TextSpan(
                              text: termsAndConditions,
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
        _buildChip(alarm),
        _buildChip(onRoute),
        _buildChip(bop),
        _buildChip(dropped),
        _buildChip(callOffice),
        GestureDetector(
            onTap: () {
              Get.to(() => const JobPage());
            },
            child: _buildChip(pushJobToDriver)),
      ],
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: kWhiteColor,
      side: const BorderSide(color: kMainColor),
    );
  }
}
