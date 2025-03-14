import 'package:flutter/material.dart';
import 'package:jewels_airport_transfers/Widgets/cards/upcoming_job_card.dart';

class UpcomingTripsScreen extends StatelessWidget {
  const UpcomingTripsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Scrollbar(
      controller: scrollController, // Attach a unique ScrollController
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
              controller: scrollController, // Use the same ScrollController
              itemCount: 5,
              itemBuilder: (context, index) {
                return  UpcomingJobCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
