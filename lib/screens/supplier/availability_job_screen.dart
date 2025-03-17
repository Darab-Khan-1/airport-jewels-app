import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/cards/availability_details_card.dart';
import '../../controlller/available_controller/available_controller.dart';

class AvailableJobsScreen extends StatefulWidget {
  AvailableJobsScreen({super.key});

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
          return const Center(child: Text('No available jobs found'));
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
