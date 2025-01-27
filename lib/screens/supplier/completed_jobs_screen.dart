import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../Widgets/buttons/custom_widgets.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

class CompletedJobsScreen extends StatelessWidget {
  const CompletedJobsScreen({super.key});

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
                return _buildTripCard(context);
              },
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
                  Expanded(
                    child: buildIconTextRow(
                      icon: Icons.directions_car,
                      text: toyata,
                      textColor: kBlackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: buildIconTextRow(
                        icon: Icons.edit_note,
                        text: refrence,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.w700,
                        data: data),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: buildIconTextRow(
                      icon: Icons.calendar_month,
                      text: date,
                      textColor: kBlackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: buildIconTextRow(
                      icon: Icons.alarm,
                      text: timeHours,
                      textColor: kBlackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: buildTextRow(
                      text: driver,
                      data: driverName,
                      textColor: kBlackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: buildTextRow(
                      text: amount,
                      data: dollars,
                      textColor: kBlackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
