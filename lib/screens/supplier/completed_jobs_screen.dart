import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/constants/extension.dart';
import 'package:jewels_airport_transfers/screens/start_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/upcoimg_job_detail_screen.dart';

import '../../Widgets/buttons/custom_widgets.dart';
import '../../Widgets/buttons/k_elevated_button.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../gen/assets.gen.dart';
import 'add_driver_screen.dart';


class CompletedJobsScreen extends StatelessWidget {
  const CompletedJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      interactive: true,
      scrollbarOrientation: ScrollbarOrientation.right,
      radius: Radius.circular(20),
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

          // Add Driver Butto
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
                        text: "Ref",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.w700,
                        data: "098937587623"
                    ),
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
                      text: "12:30 AM",
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
                      text: "Driver: ",
                      data: "Adnan",
                      textColor: kBlackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: buildTextRow(
                      text: "Amount: ",
                      data: "£ 897",
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

