import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/screens/supplier/availability_job_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/completed_jobs_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/quotation_job_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/upcoming_jobs_screen.dart';
import '../../Widgets/buttons/k_elevated_button.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import 'add_driver_screen.dart';

class SupplierHomeScreen extends StatelessWidget {
  final bool? isDriver;
  const SupplierHomeScreen({super.key, this.isDriver = false});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
          title: const Text(appName1),
          leading: const SizedBox(),
        ),
        body: Column(
          children: [
            _buildTabBar(),
            const Gap(10),
            Expanded(
              child: TabBarView(
                children: [
                  const QuotationJobScreen(),
                  const AvailabilityJobScreen(),
                  const UpcomingTripsScreen(),
                  const CompletedJobsScreen(),
                  _buildCommentsSection(context),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: isDriver!
            ? null
            : Padding(
                padding: const EdgeInsets.all(7.0),
                child: KElevatedButton2(
                  onPressed: () {
                    Get.to(() => AddDriverScreen());
                  },
                  text: addDriver,
                ),
              ),
      ),
    );
  }

  /// Builds the TabBar
  Widget _buildTabBar() {
    return Container(
      color: kBlueColor,
      child: const TabBar(
        indicatorColor: kWhiteColor,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorWeight: 4.0,
        labelColor: kWhiteColor,
        indicatorSize: TabBarIndicatorSize.tab,
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
          Tab(text: quotation),
          Tab(text: availability),
          Tab(text: upcomimg),
          Tab(text: completed),
          Tab(text: comments),
        ],
      ),
    );
  }

  /// Builds the comments section with RichText widgets
  Widget _buildCommentsSection(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(3, (index) => _buildCommentItem(context)),
      ),
    );
  }

  /// Builds individual comment items
  Widget _buildCommentItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: RichText(
        text: TextSpan(
          text: comment1,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: kBlackColor,
                fontWeight: FontWeight.normal,
              ),
          children: [
            TextSpan(
              text: authorized,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Add tap logic here if required
                },
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: kBlueColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
