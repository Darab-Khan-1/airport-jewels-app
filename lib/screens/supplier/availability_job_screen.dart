import 'package:flutter/material.dart';
import 'package:jewels_airport_transfers/Widgets/cards/availability_details_card.dart';

class AvailabilityJobScreen extends StatelessWidget {
  const AvailabilityJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController(); // Define a controller

    return Scrollbar(
      thumbVisibility: true,
      interactive: true,
      scrollbarOrientation: ScrollbarOrientation.right,
      radius: const Radius.circular(20),
      trackVisibility: true,
      thickness: 10,
      controller: scrollController, // Attach the controller
      child: SingleChildScrollView(
        controller: scrollController, // Attach the controller here as well
        child: Column(
          children: [
            // Trips List
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent inner scrolling
              itemBuilder: (context, index) {
                return const AvailabilityDetailsCard();
              },
            ),

            // Add Driver Button
          ],
        ),
      ),
    );
  }
}
