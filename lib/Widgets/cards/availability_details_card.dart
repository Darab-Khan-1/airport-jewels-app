import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/Widgets/text_field/text_input_field.dart';
import '../../constants/color.dart'; // Assuming you have defined your color constants
import '../buttons/custom_widgets.dart';
import '../buttons/leading_button.dart'; // Assuming your helper widgets are here

class AvailabilityDetailsCard extends StatelessWidget {
  const AvailabilityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  Gap(10),
                  Row(
                    children: [
                      Text(
                        "Fare Quote:",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        "£76.00",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: kgreenColor,
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),

                  Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            // Handle submit action
                          },
                          style: Theme.of(context).filledButtonTheme.style?.copyWith(
                            backgroundColor: WidgetStatePropertyAll(kRedColor),
                          ),
                          child: const Text(
                            "Reject",

                          ),
                        ),
                      ),
                      Gap(15),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            // Handle submit action
                          },
                          style: Theme.of(context).filledButtonTheme.style?.copyWith(
                            backgroundColor: WidgetStatePropertyAll(kgreenColor),
                          ),
                          child: const Text(
                            "Accept",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
