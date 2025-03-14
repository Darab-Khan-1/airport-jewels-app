import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/color.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import 'package:jewels_airport_transfers/screens/supplier/job_page.dart';

class DriverScreen extends StatelessWidget {
  final List<Map<String, String>> driverData = [
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
      'email': 'DanielHarrison667@example.com',
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

  DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // Handle back navigation
            Navigator.pop(context);
          },
        ),
        title: Text(
          myDriver,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display each driver's information in a card
            Expanded(
              child: ListView.builder(
                itemCount: driverData.length, // The number of drivers (5)
                itemBuilder: (context, index) {
                  final driver = driverData[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => const JobPage());
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            // Driver's picture
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(driver['image']!),
                            ),
                            const Gap(15),
                            // Driver's details
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  driver['name']!, // Driver's name
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: kBlackColor,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  'Email: ${driver['email']}',
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: kBlackColor,
                                      fontWeight: FontWeight.w300),
                                ),
                                const Gap(5),
                                Text(
                                  'Phone: ${driver['phone']}',
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: kBlackColor,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
