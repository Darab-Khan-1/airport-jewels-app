import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../constants/color.dart';
import '../../constants/enum.dart';
import '../../constants/global.dart';
import '../../constants/string.dart';
import '../../screens/supplier/upcoimg_job_detail_screen.dart';
import '../buttons/custom_widgets.dart';

class UpcomingJobCard extends StatelessWidget {
  const UpcomingJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return jobCard(context);
  }

  Widget jobCard(BuildContext context) {
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
                                  text: refrence,
                                  textColor: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                  data: data),
                            ),
                          ],
                        ),
                        const Gap(10),
                        buildIconTextRow(
                          icon: Icons.location_on,
                          text: lahorePakistanIslambad,
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                        const Gap(10),
                        buildIconTextRow(
                          icon: Icons.location_on,
                          iconColor: kRedColor,
                          text: lahorePakistanIslambad,
                          textColor: kBlackColor,
                          fontWeight: FontWeight.w400,
                        ),
                        const Gap(10),
                        buildIconTextRow(
                          icon: Icons.route_outlined,
                          iconColor: kRedColor,
                          text: approximate,
                          data: miles,
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
              if(Global().userRole == UserRole.DRIVER)...[
              const Gap(10),
                buildIconTextRow(
                  icon: Icons.person,
                  text: assignTo,
                  data: "Adnan",
                  textColor: kBlackColor,
                  fontWeight: FontWeight.w700,
                ),
              Gap(10),
              buildIconTextRow(
                icon: Icons.money,
                  text: fareAssigned,
                  textColor: kBlackColor,
                  fontWeight: FontWeight.bold,
                  data: "£50"),
              ],
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: buildIconTextRow(
                      icon: Icons.alarm,
                      iconColor: kRedColor,
                      text: timeHours,
                      textColor: kBlackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        Get.to(() => const UpcomingJobDetailScreen());
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
