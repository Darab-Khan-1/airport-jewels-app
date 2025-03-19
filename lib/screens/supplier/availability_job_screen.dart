import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../Widgets/cards/availability_details_card.dart';
import '../../constants/color.dart';
import '../../controlller/available_controller/available_controller.dart';

class AvailableJobsScreen extends StatefulWidget {
  const AvailableJobsScreen({super.key});

  @override
  State<AvailableJobsScreen> createState() => _AvailableJobsScreenState();
}

class _AvailableJobsScreenState extends State<AvailableJobsScreen> {
  final AvailableController controller = Get.put(AvailableController());

  @override
  void initState() {
    // TODO: implement initState
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
                  'No Available Jobs found',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: kBlackColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          );
          ;
        }

        return ListView.builder(
          itemCount: controller.availablelJobModel.value.data!.length,
          itemBuilder: (context, index) {
            final jobData = controller.availablelJobModel.value.data![index];
            return AvailabilityDetailsCard(data: jobData);
          },
        );
      }),
    );
  }
}
