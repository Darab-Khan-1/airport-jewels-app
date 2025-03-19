import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/screens/profile_screen/profile_avatar.dart';
import '../../Widgets/info_cards/info_card.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../../controlller/profile_controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final profileController = Get.put(ProfileController());

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
              profile,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: kWhiteColor),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              const Gap(20),
              // Circular Profile Picture
              ProfileAvatar(
                imageUrl:
                    profileController.profileModel.value.data?.driverImg ?? "",
                size: 100,
                borderColor: kWhiteColor,
                borderWidth: 2.0,
              ),
              const Gap(20),
              InfoCard(
                icon: Icons.person,
                text:
                    "${profileController.profileModel.value.data?.firstname ?? ""} ${profileController.profileModel.value.data?.lastname ?? ""}",
              ),

              InfoCard(
                  icon: Icons.location_on,
                  text: profileController.profileModel.value.data?.address1 ??
                      ""),
              InfoCard(
                  icon: Icons.email,
                  text: profileController.profileModel.value.data?.email ?? ""),
              InfoCard(
                  icon: Icons.phone,
                  text: profileController.profileModel.value.data?.mob ?? ""),
              InfoCard(
                  icon: Icons.directions_car_outlined,
                  text:
                      profileController.profileModel.value.data?.customerType ??
                          ""),
              InfoCard(
                  icon: Icons.location_city,
                  text:
                      profileController.profileModel.value.data?.cityId ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
