import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import '../../Widgets/cards/availability_details_card.dart';
import '../../controlller/available_controller/available_controller.dart';

class AvailableJobsScreen extends StatefulWidget {
  const AvailableJobsScreen({super.key});

  @override
  State<AvailableJobsScreen> createState() => _AvailableJobsScreenState();
}

class _AvailableJobsScreenState extends State<AvailableJobsScreen> {
  final AvailableController controller = Get.put(AvailableController());
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    controller.scheduledJourneyDetails(context);
  }

  /// Function to refresh data
  void _onRefresh() async {
    await controller.scheduledJourneyDetails(context);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isAvailableLoading.value) {
          return _buildShimmerEffect();
        }

        if (controller.scheduledJourneyModel.value.data == null ||
            controller.scheduledJourneyModel.value.data!.isEmpty) {
          return const Center(child: Text('No available jobs found'));
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _onRefresh,
          header: const WaterDropHeader(),
          child: ListView.builder(
            itemCount: controller.scheduledJourneyModel.value.data!.length,
            itemBuilder: (context, index) {
              final data = controller.scheduledJourneyModel.value.data![index];
              return AvailabilityDetailsCard(data: data);
            },
          ),
        );
      }),
    );
  }

  /// Shimmer Effect for Loading State
  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 5, // Placeholder count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
}
