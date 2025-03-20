import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:jewels_airport_transfers/Widgets/buttons/leading_button.dart';
import 'package:jewels_airport_transfers/constants/enum.dart';
import 'package:jewels_airport_transfers/constants/global.dart';
import 'package:jewels_airport_transfers/screens/supplier/job_page.dart';
import '../../Widgets/buttons/custom_widgets.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

class UpcomingJobDetailScreen extends StatefulWidget {
  const UpcomingJobDetailScreen({super.key});

  @override
  State<UpcomingJobDetailScreen> createState() =>
      _UpcomingJobDetailScreenState();
}

class _UpcomingJobDetailScreenState extends State<UpcomingJobDetailScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// Simulated API call for loading data
  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulated delay
    setState(() {
      _isLoading = false;
    });
  }

  /// Refresh job details
  void _onRefresh() async {
    setState(() {
      _isLoading = true;
    });
    await _loadData();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingButton(),
        title: const Text(driverInstructions),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _onRefresh,
        header: const WaterDropHeader(),
        child: _isLoading ? _buildShimmerEffect() : _buildJobDetails(),
      ),
    );
  }

  /// Shimmer Effect for Loading State
  Widget _buildShimmerEffect() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  /// Main Job Detail UI
  Widget _buildJobDetails() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      child: Column(
        children: [
          _buildJobCard(),
          const Gap(10),
          _buildPassengerInfoCard(),
          _buildServiceInfoCard(),
          const Gap(10),
          _buildTermsAndConditions(),
          const Gap(10),
          _buildActionButtons(),
        ],
      ),
    );
  }

  /// Job Card
  Widget _buildJobCard() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: buildIconTextRow(
                        icon: Icons.directions_car,
                        text: saloon,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.w500)),
                Expanded(
                    child: buildIconTextRow(
                        icon: Icons.edit_note,
                        text: refrence,
                        data: data,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            const Gap(10),
            buildIconTextRow(
                icon: Icons.person,
                text: passenger,
                data: passengerData,
                textColor: kBlackColor,
                fontWeight: FontWeight.w500),
            const Gap(10),
            buildIconTextRow(
                icon: Icons.luggage,
                text: lauggage,
                data: lauggageType,
                textColor: kBlackColor,
                fontWeight: FontWeight.w500),
            const Gap(10),
            buildIconTextRow(
                icon: Icons.radio_button_checked,
                text: pickUp,
                data: locationA,
                textColor: kBlackColor,
                fontWeight: FontWeight.w500),
            const Gap(10),
            buildIconTextRow(
                icon: Icons.location_on,
                text: dropOff,
                data: locationB,
                textColor: kBlackColor,
                fontWeight: FontWeight.w500),
            const Gap(10),
            Row(
              children: [
                Expanded(
                    child: buildIconTextRow(
                        icon: Icons.timeline,
                        text: approximate,
                        data: miles,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.w500)),
                Expanded(
                    child: buildIconTextRow(
                        icon: Icons.handshake,
                        text: meetAndGreet,
                        data: yes,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Passenger Information Card
  Widget _buildPassengerInfoCard() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(passengerInformation,
                style: Theme.of(context).textTheme.titleSmall),
            const Gap(10),
            buildTextRow(
                text: name,
                data: passenegerName,
                textColor: kBlackColor,
                fontWeight: FontWeight.w500),
            const Gap(5),
            buildTextRow(
                text: mobile,
                data: mobileDigits,
                textColor: kBlackColor,
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }

  /// Service Information Card
  Widget _buildServiceInfoCard() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(serviceInformation,
                style: Theme.of(context).textTheme.titleSmall),
            buildIconTextRow(
                icon: Icons.flight_takeoff,
                text: "BE4783",
                textColor: kBlueColor,
                fontWeight: FontWeight.w500),
            const Gap(10),
            buildIconTextRow(
                icon: Icons.flight_land_outlined,
                text: lahore,
                textColor: kBlueColor,
                fontWeight: FontWeight.w500),
            const Gap(10),
            Row(
              children: [
                Text(fareAccepted,
                    style: Theme.of(context).textTheme.labelLarge),
                const Gap(10),
                const Text(dollars,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: kgreenColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Terms and Conditions Widget
  Widget _buildTermsAndConditions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_box, color: kPrimaryColor),
          const Gap(8),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: bySubmitingYourQuote,
                style: const TextStyle(color: kBlackColor, fontSize: 14.0),
                children: [
                  TextSpan(
                    text: termsAndConditions,
                    style: TextStyle(
                        color: kPrimaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Action Buttons
  Widget _buildActionButtons() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildChip(alarm, backgroundColor: kRedColor),
        _buildChip(onRoute, backgroundColor: kgreenColor),
        _buildChip(bop, backgroundColor: kYellowColor),
        _buildChip(dropped, backgroundColor: kBlueColor),
        _buildChip(callOffice, backgroundColor: kPurpleColor),
        Global().userRole == UserRole.SUPPLIER
            ? GestureDetector(
                onTap: () => Get.to(() => JobScreen()),
                child:
                    _buildChip(pushJobToDriver, backgroundColor: kPrimaryColor))
            : const SizedBox(),
      ],
    );
  }

  Widget _buildChip(String label, {Color? backgroundColor}) {
    return Chip(
      label: Text(label,
          style:
              const TextStyle(color: kWhiteColor, fontWeight: FontWeight.bold)),
      backgroundColor: backgroundColor ?? kWhiteColor,
    );
  }
}
