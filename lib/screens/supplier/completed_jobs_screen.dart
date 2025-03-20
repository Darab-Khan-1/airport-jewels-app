import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import '../../Widgets/buttons/custom_widgets.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

class CompletedJobsScreen extends StatefulWidget {
  const CompletedJobsScreen({super.key});

  @override
  State<CompletedJobsScreen> createState() => _CompletedJobsScreenState();
}

class _CompletedJobsScreenState extends State<CompletedJobsScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// Simulate data loading
  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulated delay
    setState(() {
      _isLoading = false;
    });
  }

  /// Function to refresh data
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
      body: Scrollbar(
        thumbVisibility: true,
        interactive: true,
        scrollbarOrientation: ScrollbarOrientation.right,
        radius: const Radius.circular(20),
        trackVisibility: true,
        thickness: 10,
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _onRefresh,
          header: const WaterDropHeader(),
          child: _isLoading ? _buildShimmerEffect() : _buildJobList(),
        ),
      ),
    );
  }

  /// Shimmer Effect for Loading State
  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 5, // Placeholder count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Job List UI
  Widget _buildJobList() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildTripCard(context);
      },
    );
  }

  /// Single Trip Card Widget
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
                      data: data,
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
