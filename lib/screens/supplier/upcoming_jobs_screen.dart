import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:jewels_airport_transfers/Widgets/cards/upcoming_job_card.dart';

class UpcomingTripsScreen extends StatefulWidget {
  const UpcomingTripsScreen({super.key});

  @override
  State<UpcomingTripsScreen> createState() => _UpcomingTripsScreenState();
}

class _UpcomingTripsScreenState extends State<UpcomingTripsScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  /// Simulated API call to load data
  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulated delay
    setState(() {
      _isLoading = false;
    });
  }

  /// Refresh the trips list
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
        controller: _scrollController,
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
          child: _isLoading ? _buildShimmerEffect() : _buildTripsList(),
        ),
      ),
    );
  }

  /// Shimmer Effect for Loading State
  Widget _buildShimmerEffect() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: 5, // Placeholder count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Upcoming Trips List
  Widget _buildTripsList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const UpcomingJobCard();
      },
    );
  }
}
