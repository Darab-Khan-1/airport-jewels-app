import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/Widgets/text_field/text_input_field.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/job_controller/job_controller.dart';

class JobScreen extends StatelessWidget {
  JobScreen({super.key});
  final jobController = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          pushJobDriver,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (jobController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (jobController.allDriverModel.value.data == null ||
              jobController.allDriverModel.value.data!.isEmpty) {
            return const Center(child: Text("No drivers available"));
          }

          return ListView.builder(
            itemCount: jobController.allDriverModel.value.data?.length ?? 0,
            itemBuilder: (context, index) {
              final driverData =
                  jobController.allDriverModel.value.data![index];

              return Obx(() => DriverCard(
                    name:
                        "${driverData.firstname ?? 'N/A'} ${driverData.lastname ?? ''}",
                    email: driverData.email ?? "N/A",
                    phone: driverData.mob ?? "N/A",
                    imageUrl: driverData.avatar ?? '',
                    isSelected:
                        jobController.selectedDriverIndex.value == index,
                    onSelect: () => jobController.selectDriver(index),
                    amount: '',
                    onDelete: () {},
                    onAmountChange: (String value) {},
                    onAssign: () {},
                  ));
            },
          );
        }),
      ),
    );
  }
}

class DriverCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String imageUrl;
  final String amount;
  final bool isSelected;
  final VoidCallback onSelect;
  final VoidCallback onDelete;
  final ValueChanged<String> onAmountChange;
  final VoidCallback onAssign;

  const DriverCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.amount,
    required this.isSelected,
    required this.onSelect,
    required this.onDelete,
    required this.onAmountChange,
    required this.onAssign,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: isSelected ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: imageUrl.isNotEmpty
                          ? CachedNetworkImageProvider(imageUrl)
                          : const AssetImage('assets/images/driver.jpeg'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Email: $email',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'Phone: $phone',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                const Text(
                    "You can edit the driver fare you wish to assign for in the box below."),
                TextInputFieldWidget(
                  initialValue: amount,
                  prefixIcon: const Text(euro),
                  textInputType: TextInputType.number,
                  onChange: onAmountChange,
                ),
                const Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: onAssign,
                        child: const Text(assign),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: FilledButton(
                        onPressed: onDelete,
                        style:
                            FilledButton.styleFrom(backgroundColor: kRedColor),
                        child: const Text(deleteDriver),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
