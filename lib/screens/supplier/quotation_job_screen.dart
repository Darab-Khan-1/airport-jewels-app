import 'package:flutter/material.dart';

import 'package:jewels_airport_transfers/Widgets/cards/quotation_job_card.dart';

class QuotationJobScreen extends StatelessWidget {
  const QuotationJobScreen({super.key});

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
                return const QuotationJobCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
