import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/Widgets/cards/quotation_details_card.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

import '../../models/available_job_model/available_job_model.dart';
import '../buttons/custom_widgets.dart';

class QuotationJobCard extends StatelessWidget {
  final Data data;
  const QuotationJobCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return quotationJobCard(context);
  }

  Widget quotationJobCard(BuildContext context) {
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
                          icon: Icons.location_on,
                          text: pickUp,
                          data: data.fromAddress ?? 'No pickup location',
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                        const Gap(10),
                        buildIconTextRow(
                          icon: Icons.location_on,
                          iconColor: kRedColor,
                          text: dropOff,
                          data: data.toAddress ?? 'No dropoff location',
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                        const Gap(10),
                        buildIconTextRow(
                          icon: Icons.route_outlined,
                          iconColor: kRedColor,
                          text: approximate,
                          data: '${data.distance ?? '0'} miles',
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                        const Gap(10),
                        buildIconTextRow(
                          icon: Icons.calendar_month,
                          text: date,
                          data: data.pickupDate ?? 'No date',
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: buildIconTextRow(
                      icon: Icons.alarm,
                      iconColor: kRedColor,
                      text: time,
                      data: data.arrivalDateTime?.split(' ').last ?? 'No time',
                      textColor: kBlackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        Get.to(() => const QuotationDetailsCard());
                      },
                      child: const Text(viewDetails),
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
