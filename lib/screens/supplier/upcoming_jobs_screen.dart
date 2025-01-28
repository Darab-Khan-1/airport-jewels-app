import 'package:flutter/material.dart';
import 'package:jewels_airport_transfers/Widgets/cards/upcoming_job_card.dart';

class UpcomingTripsScreen extends StatelessWidget {
  final bool isDriver;
  const UpcomingTripsScreen({super.key, required this.isDriver});

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
              itemBuilder: (context, index) {
                return  UpcomingJobCard(isDriver: isDriver,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
