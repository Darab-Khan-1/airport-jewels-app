import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import '../../Widgets/cards/quotation_job_card.dart';
import '../../constants/color.dart';
import '../../controlller/quotation_controller/quotation_controller.dart';

class QuotationJobScreen extends StatefulWidget {
  const QuotationJobScreen({super.key});

  @override
  State<QuotationJobScreen> createState() => _QuotationJobScreenState();
}

class _QuotationJobScreenState extends State<QuotationJobScreen> {
  final QuotationController controller = Get.put(QuotationController());
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    controller.getAvailableJobs(context);
  }

  /// Function to refresh the quotation job list
  void _onRefresh() async {
    await controller.getAvailableJobs(context);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isAvailableLoading.value) {
          return _buildShimmerEffect();
        }

        if (controller.availablelJobModel.value.data == null ||
            controller.availablelJobModel.value.data!.isEmpty) {
          return _buildNoQuotationsFound();
        }

        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _onRefresh,
          header: const WaterDropHeader(),
          child: ListView.builder(
            itemCount: controller.availablelJobModel.value.data!.length,
            itemBuilder: (context, index) {
              final jobData = controller.availablelJobModel.value.data![index];
              return QuotationJobCard(data: jobData);
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

  /// No Quotations Found Widget
  Widget _buildNoQuotationsFound() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.rocket_launch_rounded, color: kBlackColor, size: 24),
          const Gap(6),
          Text(
            'No Quotations found',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
