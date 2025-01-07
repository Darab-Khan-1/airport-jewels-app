import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/screens/supplier/add_driver_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/view_detail_screen.dart';
import '../../Widgets/buttons/k_elevated_button.dart';
import '../../Widgets/right_side_slider/right_side_slider.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../gen/assets.gen.dart';

class SupplierUpcomingScreen extends StatelessWidget {
  const SupplierUpcomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            appName1,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: kBlueColor,
              child: const TabBar(
                indicatorColor: kWhiteColor,
                indicatorWeight: 4.0,
                labelColor: kWhiteColor,
                unselectedLabelColor: kgreyColor1,
                labelStyle: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
                tabs: [
                  Tab(text: upcomimg),
                  Tab(text: completed),
                  Tab(text: comments),
                ],
              ),
            ),
            const Gap(10),
            Expanded(
              child: TabBarView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 1.0),
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  Assets
                                                      .images.airplaneLogo.path,
                                                  height: 80,
                                                  width: 80,
                                                ),
                                                const Gap(10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.directions_car,
                                                          size: 20,
                                                          color: kBlueColor,
                                                        ),
                                                        const Gap(5),
                                                        Text(
                                                          toyata,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelMedium
                                                                  ?.copyWith(
                                                                    color:
                                                                        kBlackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Gap(10),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on,
                                                          size: 20,
                                                          color: Colors.blue,
                                                        ),
                                                        Text(
                                                          doted,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelMedium
                                                                  ?.copyWith(
                                                                    color:
                                                                        kGradient2,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                  ),
                                                        ),
                                                        const Icon(
                                                          Icons.location_on,
                                                          size: 20,
                                                          color: kRedColor,
                                                        ),
                                                      ],
                                                    ),
                                                    const Gap(10),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons.calendar_month,
                                                          size: 20,
                                                          color: kBlueColor,
                                                        ),
                                                        const Gap(2),
                                                        Text(
                                                          date,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelMedium
                                                                  ?.copyWith(
                                                                    color:
                                                                        kBlackColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0),
                                                child: SizedBox(
                                                  width: 80,
                                                  height: 30,
                                                  child:
                                                      KElevatedButton1Transparent(
                                                    onPressed: () {
                                                      Get.to(() =>
                                                          const ViewDetailScreen());
                                                    },
                                                    text: details,
                                                  ),
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
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: SizedBox(
                                  width: 160,
                                  height: 40,
                                  child: KElevatedButton2Transparent(
                                    onPressed: () {
                                      Get.to(() => AddDriverScreen());
                                    },
                                    text: adddriver,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RightSideSlider(),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 1.0),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            Assets.images.airplaneLogo.path,
                                            height: 80,
                                            width: 80,
                                          ),
                                          const Gap(10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.directions_car,
                                                    size: 20,
                                                    color: kBlueColor,
                                                  ),
                                                  const Gap(5),
                                                  Text(
                                                    toyata,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium
                                                        ?.copyWith(
                                                          color: kBlackColor,
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                                    color: kBlueColor,
                                                  ),
                                                  Text(
                                                    doted,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium
                                                        ?.copyWith(
                                                          color: kGradient2,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                  ),
                                                  const Icon(
                                                    Icons.location_on,
                                                    size: 20,
                                                    color: kRedColor,
                                                  ),
                                                ],
                                              ),
                                              const Gap(10),
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 0),
                                          child: SizedBox(
                                            width: 80,
                                            height: 30,
                                            child: KElevatedButton1Transparent(
                                              onPressed: () {},
                                              text: details,
                                            ),
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
                      ),
                      RightSideSlider(),
                    ],
                  ),

                  // Content for 'Comment' with slider
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                      ),
                      RightSideSlider(),
                    ],
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

// Right Side Slider Widget
