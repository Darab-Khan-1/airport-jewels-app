import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/screens/supplier/push_job_screen.dart';
import '../../Widgets/buttons/k_elevated_button.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  final List<Map<String, String>> drivers = [
    {
      'name': 'William Parker',
      'email': 'willaimparker123@example.com',
      'phone': '123-456-7890',
      'image':
          'assets/images/driver.jpeg', // Add the path for each driver's image
    },
    {
      'name': 'Sarah Collins',
      'email': 'Sarahcollins234@example.com',
      'phone': '234-567-8901',
      'image':
          'assets/images/driver.jpeg', // Add the path for each driver's image
    },
    {
      'name': 'Daniel Harrison',
      'email': 'Harrison667@example.com',
      'phone': '345-678-9012',
      'image':
          'assets/images/driver.jpeg', // Add the path for each driver's image
    },
    {
      'name': 'Emily Bennett',
      'email': 'EmilyBennett987@example.com',
      'phone': '456-789-0123',
      'image':
          'assets/images/driver.jpeg', // Add the path for each driver's image
    },
    {
      'name': 'James Carter',
      'email': 'JamesCarter455@example.com',
      'phone': '567-890-1234',
      'image':
          'assets/images/driver.jpeg', // Add the path for each driver's image
    },
  ];

  int? selectedCardIndex; // Tracks the selected card index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          push,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 5, // Set fixed number of containers
          itemBuilder: (context, index) {
            // Safeguard if fewer items than 4
            if (index >= drivers.length) {
              return const SizedBox(); // Placeholder for missing data
            }
            final driver = drivers[index];
            bool isSelected = selectedCardIndex == index; // Check if selected
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCardIndex = index; // Update selected index
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                padding:
                    const EdgeInsets.all(5), // Inner padding for border effect
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: isSelected ? kBlueColor : kTransparent,
                    width: isSelected ? 5.0 : 1.0,
                  ),
                  borderRadius: BorderRadius.zero, // No border radius
                ),
                child: Card(
                  elevation: 2.5,
                  margin: EdgeInsets.zero, // Remove Card margin
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(driver['image']!),
                            ),
                            const Gap(8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  driver['name']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: kBlackColor,
                                          fontWeight: FontWeight.bold),
                                ),
                                const Gap(3),
                                Text(
                                  'Email: ${driver['email']}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: kBlackColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                ),
                                const Gap(5),
                                Text(
                                  'Phone: ${driver[phone]}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: kBlackColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(15),
                        Align(
                          alignment: Alignment.center,
                          child: KElevatedButton2(
                            onPressed: () {
                              Get.to(() => PushJobScreen());
                              // Add driver logic here
                            },
                            text: push,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
