import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/Widgets/cards/availability_details_card.dart';
import 'package:jewels_airport_transfers/constants/extension.dart';
import 'package:jewels_airport_transfers/screens/start_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/view_detail_screen.dart';

import '../../Widgets/buttons/k_elevated_button.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../gen/assets.gen.dart';
import 'add_driver_screen.dart';


class AvailabilityJobScreen extends StatelessWidget {
  const AvailabilityJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      interactive: true,
      scrollbarOrientation: ScrollbarOrientation.right,
      radius: const Radius.circular(20),
      trackVisibility: true,
      thickness: 10,
      child: Column(
        children: [
          // Trips List
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,

              itemBuilder: (context, index) {
                return const AvailabilityDetailsCard();
              },
            ),
          ),

          // Add Driver Button
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: KElevatedButton2(
              onPressed: () {
                Get.to(() =>  AddDriverScreen());
              },
              text: adddriver,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset(
                    Assets.images.jewelsLogo1.path,
                    height: 80,
                    width: 80,
                  ),
                  const Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildIconTextRow(
                          icon: Icons.directions_car,
                          text: toyata,
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w700,
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 20, color: Colors.blue),
                            Text(
                              doted,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: kGradient2,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Icon(Icons.location_on, size: 20, color: kRedColor),
                          ],
                        ),
                        const Gap(10),
                        _buildIconTextRow(
                          icon: Icons.calendar_month,
                          text: date,
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(10),
              SizedBox(
                width: context.screenWidth * 0.3,
                child: FilledButton(
                  onPressed: () {
                    Get.to(() => const ViewDetailScreen());
                  },
                  child: const Text(details),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconTextRow({
    required IconData icon,
    required String text,
    required Color textColor,
    required FontWeight fontWeight,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: kBlueColor),
        const Gap(5),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}

