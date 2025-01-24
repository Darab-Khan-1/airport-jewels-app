import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/Widgets/cards/availability_details_card.dart';
import 'package:jewels_airport_transfers/constants/extension.dart';
import 'package:jewels_airport_transfers/screens/start_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/upcoimg_job_detail_screen.dart';

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
        ],
      ),
    );
  }

}

