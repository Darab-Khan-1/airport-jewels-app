import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/Widgets/cards/quotation_job_card.dart';

import '../../constants/color.dart';
import '../../controlller/quotation_controller/quotation_controller.dart';

class QuotationJobScreen extends StatefulWidget {
  const QuotationJobScreen({super.key});

  @override
  State<QuotationJobScreen> createState() => _QuotationJobScreenState();
}

class _QuotationJobScreenState extends State<QuotationJobScreen> {
  final QuotationController controller = Get.put(QuotationController());

  @override
  void initState() {
    super.initState();
    controller.getAvailableJobs(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isAvailableLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.availablelJobModel.value.data == null ||
            controller.availablelJobModel.value.data!.isEmpty) {
          return Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.rocket_launch_rounded,
                    color: kBlackColor, size: 24),
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

        return ListView.builder(
          itemCount: controller.availablelJobModel.value.data!.length,
          itemBuilder: (context, index) {
            final jobData = controller.availablelJobModel.value.data![index];
            return QuotationJobCard(data: jobData);
          },
        );
      }),
    );
  }
}
