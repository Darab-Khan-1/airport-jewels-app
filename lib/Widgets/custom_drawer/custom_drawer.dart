import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import '../../constants/color.dart';
import '../../screens/change_password_screen/change_password_screen.dart';
import '../../screens/profile_screen/profile_screen.dart';
import '../delete_account_dialouge/delete_account_dialouge.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  void _deleteUserAccount() {
    print("User account deleted.");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Gap(100),
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child:
                              Icon(Icons.person, size: 50, color: kGreyColor),
                        ),
                        const Gap(5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Text(
                                appName1,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.w600),
                              ),
                              const Gap(5),
                              Text(
                                email,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Gap(40),
                        _buildDivider(),
                        _buildDrawerOption(
                          context,
                          title: changePassword,
                          icon: Icons.lock,
                          onTap: () {
                            Get.to(() => ChangePasswordScreen());
                          },
                        ),
                        _buildDivider(),
                        _buildDrawerOption(
                          context,
                          title: "Delete Account",
                          icon: Icons.delete_rounded,
                          onTap: () {
                            showDeleteAccountDialog(context, () {
                              _deleteUserAccount(); // Call delete function
                            });
                          },
                        ),
                        _buildDivider(),
                        _buildDrawerOption(
                          context,
                          title: editProfile,
                          icon: Icons.edit,
                          onTap: () {
                            Get.to(() => const ProfileScreen());
                          },
                        ),
                        _buildDivider(),
                        _buildDrawerOption(
                          context,
                          title: signOut,
                          icon: Icons.logout_outlined,
                          onTap: () {
                            // Sign out logic here
                          },
                        ),
                        const Gap(20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteAccountDialog(BuildContext context, VoidCallback onDelete) {
    showDialog(
      context: context,
      builder: (context) => DeleteAccountDialog(onConfirm: onDelete),
    );
  }

  Widget _buildDrawerOption(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: kGreyColor),
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(thickness: 0.7, color: kBlackColor);
  }
}

// Model class for sub-options
class DrawerSubOption {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DrawerSubOption({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
