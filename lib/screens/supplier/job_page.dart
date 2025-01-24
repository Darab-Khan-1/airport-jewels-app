import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/Widgets/buttons/custom_widgets.dart';
import '../../Widgets/buttons/k_elevated_button.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import 'push_job_screen.dart';

class JobPage extends StatefulWidget {
  const JobPage({Key? key}) : super(key: key);

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  final List<Map<String, String>> drivers = [
    {
      'name': 'William Parker',
      'email': 'willaimparker123@example.com',
      'phone': '123-456-7890',
      'image': 'assets/images/driver.jpeg'
    },
    {
      'name': 'Sarah Collins',
      'email': 'Sarahcollins234@example.com',
      'phone': '234-567-8901',
      'image': 'assets/images/driver.jpeg'
    },
    {
      'name': 'Daniel Harrison',
      'email': 'Harrison667@example.com',
      'phone': '345-678-9012',
      'image': 'assets/images/driver.jpeg'
    },
    {
      'name': 'Emily Bennett',
      'email': 'EmilyBennett987@example.com',
      'phone': '456-789-0123',
      'image': 'assets/images/driver.jpeg'
    },
    {
      'name': 'James Carter',
      'email': 'JamesCarter455@example.com',
      'phone': '567-890-1234',
      'image': 'assets/images/driver.jpeg'
    },
  ];

  int? selectedCardIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text(push),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: drivers.length,
        itemBuilder: (_, index) {
          final driver = drivers[index];
          final isSelected = selectedCardIndex == index;

          return GestureDetector(
            onTap: () => setState(() => selectedCardIndex = index),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? kBlueColor : Colors.transparent,
                  width: isSelected ? 3 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(driver['image']!)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  driver['name']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text('Email: ${driver['email']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: kBlackColor)),
                                Text('Phone: ${driver['phone']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: kBlackColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: buildTextRow(
                                  text: "Driver Amount:",
                                  data: " £4325",
                                  textColor: kBlackColor,
                                  fontWeight: FontWeight.bold)),
                          Expanded(
                            child: FilledButton(
                              onPressed: () => Get.back(),
                              child: Text("Assign"),
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
        },
      ),
    );
  }
}
