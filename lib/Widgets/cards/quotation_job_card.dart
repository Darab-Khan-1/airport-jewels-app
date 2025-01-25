import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/Widgets/cards/quotation_details_card.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../screens/supplier/upcoimg_job_detail_screen.dart';
import '../buttons/custom_widgets.dart';

class QuotationJobCard extends StatelessWidget {
  const QuotationJobCard({super.key});

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
                        buildIconTextRow(
                          icon: Icons.location_on,
                          text: doted,
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                        const Gap(10),
                        buildIconTextRow(
                          icon: Icons.location_on,
                          iconColor: kRedColor,
                          text: doted,
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                        const Gap(10),
                        buildIconTextRow(
                          icon: Icons.route_outlined,
                          iconColor: kRedColor,
                          text: "Approx",
                          data: "25 miles",
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                        const Gap(10),
                        buildIconTextRow(
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
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: buildIconTextRow(
                      icon: Icons.alarm,
                      iconColor: kRedColor,
                      text: "12:30 AM",
                      textColor: kBlackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        Get.to(() => const QuotationDetailsCard());
                      },
                      child: Text(details),
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
