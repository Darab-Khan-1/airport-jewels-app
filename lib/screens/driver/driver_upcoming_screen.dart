import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/color.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import 'package:jewels_airport_transfers/screens/details/detail_screen.dart';

import '../../Widgets/buttons/k_elevated_button.dart';
import '../../gen/assets.gen.dart';

class DriverUpcomingScreen extends StatelessWidget {
  const DriverUpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
              // Handle back action here
            },
          ),
          title: const Text(
            appName1,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: kWhiteColor, fontSize: 19),
          ),
        ),
        body: Column(
          children: [
            // Tab bar within a container
            Container(
              color: kBlueColor, // Background color for the tab bar
              child: const TabBar(
                indicatorColor:
                    kWhiteColor, // White line below the selected tab
                indicatorWeight: 4.0,
                labelColor: kWhiteColor, // Color of the selected tab text
                unselectedLabelColor:
                    kgreyColor1, // Color of unselected tab text
                labelStyle: TextStyle(
                    fontSize: 17.0,
                    fontWeight:
                        FontWeight.w700), // Smaller font size for selected tab
                unselectedLabelStyle: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight
                        .w700), // Smaller font size for unselected tabs
                tabs: [
                  Tab(
                    text: upcomimg,
                  ),
                  Tab(
                    text: completed,
                  ),
                  Tab(
                    text: comments,
                  ),
                ],
              ),
            ),
            const Gap(10),

            // Tab view content
            Expanded(
              child: TabBarView(
                children: [
                  // Content for 'Upcoming'
                  ListView.builder(
                    itemCount: 5, // Repeat 5 times
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: Card(
                          elevation: 5, // Add elevation for card shadow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Rounded corners for the card
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start, // Ensure all children are aligned to the start
                                  children: [
                                    // Image on the left with no shift
                                    Image.asset(
                                      Assets.images.jewelsLogo1.path,
                                      height: 80,
                                      width: 80,
                                    ),
                                    const Gap(10),

                                    // Create a Column for car icon + text and location row
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // First row with car icon and toyota text
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.directions_car,
                                              size: 20,
                                              color: kBlueColor,
                                            ),
                                            const Gap(5),
                                            Text(
                                              toyata, // Ensure toyota is a string or properly defined variable
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    color:
                                                        kBlackColor, // Ensure kBlackColor is defined
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        const Gap(2),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              size: 20,
                                              color: Colors.blue,
                                            ),
                                            Text(
                                              doted,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    color: kGradient2,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            const Icon(
                                              Icons.location_on,
                                              size: 20,
                                              color: kRedColor,
                                            ),
                                          ],
                                        ),
                                        const Gap(5), // Spacing between rows

                                        // Third row with calendar icon and date
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              size: 20,
                                              color: Colors.blue,
                                            ),
                                            const Gap(2),
                                            Text(
                                              date,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    color: kBlackColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 160),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        KButton1(
                                          onPressed: () {
                                            Get.to(() => const DetailScreen());
                                          },
                                          text: details,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Content for 'Completed'
                  ListView.builder(
                    itemCount: 5, // Repeat 5 times
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 1.0), // Add vertical spacing
                        child: Card(
                          elevation: 5, // Add some shadow for better separation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Optional: rounded corners for the card
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                                10), // Padding inside the card
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .start, // Align children to the start
                                  children: [
                                    // Image on the left with no shift
                                    Image.asset(
                                      Assets.images.jewelsLogo1.path,
                                      height: 90,
                                      width: 90,
                                    ),
                                    const Gap(10),

                                    // Column for car icon + text and location row
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // First row with car icon and toyota text
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.directions_car,
                                              size: 20,
                                              color: kBlueColor,
                                            ),
                                            const Gap(5),
                                            Text(
                                              toyata, // Ensure toyota is a string or properly defined variable
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    color:
                                                        kBlackColor, // Ensure kBlackColor is defined
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        const Gap(2), // Spacing between rows

                                        // Second row with location icons and text
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              size: 20,
                                              color: Colors.blue,
                                            ),
                                            Text(
                                              doted,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    color: kGradient2,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                            ),
                                            const Icon(
                                              Icons.location_on,
                                              size: 20,
                                              color: kRedColor,
                                            ),
                                          ],
                                        ),
                                        const Gap(5), // Spacing between rows

                                        // Third row with calendar icon and date
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              size: 20,
                                              color: Colors.blue,
                                            ),
                                            const Gap(2),
                                            Text(
                                              date,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    color: kBlackColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 160),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        KButton1(
                                          onPressed: () {
                                            Get.to(() => const DetailScreen());
                                          },
                                          text: details,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Content for 'Comment'
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
                    child: Align(
                      alignment:
                          Alignment.topCenter, // Aligns the widget at the top
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // Ensures it stays at the top
                        children: [
                          RichText(
                            text: TextSpan(
                              text: comment1,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer(),
                                  text: authorized,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: kBlueColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(10),
                          RichText(
                            text: TextSpan(
                              text: comment1,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer(),
                                  text: authorized,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: kBlueColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Gap(10),
                          RichText(
                            text: TextSpan(
                              text: comment1,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer(),
                                  text: authorized,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: kBlueColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
