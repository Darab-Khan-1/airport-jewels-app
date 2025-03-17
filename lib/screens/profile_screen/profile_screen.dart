import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Widgets/info_cards/info_card.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: kMainColor,
        title: Column(
          children: [
            Text(
              editProfile,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: kWhiteColor),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            // Circular Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/driver.jpeg'),
            ),
            Gap(20),
            InfoCard(icon: Icons.person, text: appName1),
            InfoCard(icon: Icons.location_on, text: address),
            InfoCard(icon: Icons.email, text: testGmailCom),
            InfoCard(icon: Icons.phone, text: number),
          ],
        ),
      ),
    );
  }
}
