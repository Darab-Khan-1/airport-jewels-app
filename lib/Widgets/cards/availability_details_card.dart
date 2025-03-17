import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import '../../constants/color.dart';
import '../buttons/custom_widgets.dart';
import '../../models/available_job_model/available_job_model.dart';

class AvailabilityDetailsCard extends StatelessWidget {
  final Data data;

  const AvailabilityDetailsCard({
    super.key,
    required this.data,
  });

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
                          text: data.carId ?? 'No car info',
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(
                        child: buildIconTextRow(
                          icon: Icons.edit_note,
                          text: data.journeyType ?? 'No journey type',
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
                    data: data.fromAddress ?? 'No pickup location',
                    textColor: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const Gap(10),
                  buildIconTextRow(
                    icon: Icons.location_on,
                    iconColor: kRedColor,
                    text: dropOff,
                    data: data.toAddress ?? 'No dropoff location',
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
                          data: '${data.distance ?? '0'} miles',
                          textColor: kBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: buildIconTextRow(
                          icon: Icons.handshake,
                          text: meetAndGreet,
                          data: data.meetGreet == '1' ? yes : no,
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
                          data: data.pickupDate ?? 'No date',
                          textColor: kBlackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: buildIconTextRow(
                          icon: Icons.access_time,
                          text: time,
                          data: data.arrivalDateTime?.split(' ').last ??
                              'No time',
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
                        data.fare ?? '0',
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
                            // Handle reject action
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
                            // Handle accept action
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
