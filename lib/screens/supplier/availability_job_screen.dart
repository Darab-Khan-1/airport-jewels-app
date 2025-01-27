import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/Widgets/cards/availability_details_card.dart';

class AvailabilityJobScreen extends StatelessWidget {
  const AvailabilityJobScreen({super.key});

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
