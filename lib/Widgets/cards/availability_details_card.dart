import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import '../../constants/color.dart';
import '../buttons/custom_widgets.dart';

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
                          text: date1,
                          data: dateMonthYear,
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
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        fareQuote,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
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
                  const Gap(15),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            // Handle submit action
                          },
                          style: Theme.of(context)
                              .filledButtonTheme
                              .style
                              ?.copyWith(
                                backgroundColor:
                                    const WidgetStatePropertyAll(kRedColor),
                              ),
                          child: const Text(
                            reject,
                          ),
                        ),
                      ),
                      const Gap(15),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            // Handle submit action
                          },
                          style: Theme.of(context)
                              .filledButtonTheme
                              .style
                              ?.copyWith(
                                backgroundColor:
                                    const WidgetStatePropertyAll(kgreenColor),
                              ),
                          child: const Text(
                            accept,
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
