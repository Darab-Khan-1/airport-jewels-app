import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/enum.dart';
import 'package:jewels_airport_transfers/constants/global.dart';
import 'package:jewels_airport_transfers/screens/supplier/availability_job_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/comment_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/completed_jobs_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/quotation_job_screen.dart';
import 'package:jewels_airport_transfers/screens/supplier/upcoming_jobs_screen.dart';
import '../../Widgets/buttons/k_elevated_button.dart';
import '../../Widgets/custom_drawer/custom_drawer.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import 'add_driver_screen.dart';

class SupplierHomeScreen extends StatelessWidget {
  SupplierHomeScreen({
    super.key,
  });
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: kWhiteColor,
              size: 30,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: const Text(appName1),
        ),
        body: Column(
          children: [
            _buildTabBar(),
            const Gap(10),
            const Expanded(
              child: TabBarView(
                children: [
                  QuotationJobScreen(),
                  AvailableJobsScreen(),
                  UpcomingTripsScreen(),
                  CompletedJobsScreen(),
                  CommentScreen(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Global().userRole != UserRole.SUPPLIER
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
}
