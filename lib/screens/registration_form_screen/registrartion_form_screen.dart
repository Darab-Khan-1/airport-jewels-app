import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/color.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import 'package:jewels_airport_transfers/controlller/auth_controller/auth_controller.dart';
import '../../Widgets/custom_tab/custom_tab.dart';
import '../../Widgets/tab_content/account_tab.dart';
import '../../Widgets/tab_content/fleet_tab.dart';
import '../../Widgets/tab_content/license_tab.dart';
import '../../Widgets/tab_content/payment_tab.dart';
import '../../models/tab_data/tab_data.dart';

class RegistrationFormScreen extends StatelessWidget {
  RegistrationFormScreen({super.key});

  final authCtrl = Get.find<AuthController>();

  final List<TabData> _tabs = [
    TabData(icon: Icons.lock, label: account1),
    TabData(icon: Icons.credit_card, label: payment1),
    TabData(icon: Icons.badge_outlined, label: license),
    TabData(icon: Icons.directions_car, label: fleet1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return Column(
            children: [
              _buildInfoBox(context),
              _buildTabBar(),
              Expanded(child: _buildTabContent()),
            ],
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBlueColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        registrartionForm,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: klightgreyColor,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: RichText(
        text: TextSpan(
          text: pleaseFillForm,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: kBlackColor, fontWeight: FontWeight.normal),
          children: [
            TextSpan(
              text: saleJewelsAirport,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: kMainColor,
                  ),
            ),
            TextSpan(
              text: alongWithCopies,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: kBlackColor, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: authCtrl.tabController,
      indicatorColor: kBlueColor,
      labelColor: kBlueColor,
      unselectedLabelColor: klightgreyColor,
      onTap: (index) {
        authCtrl.tabController.index = index;
        authCtrl.update();
      },
      tabs: _tabs
          .asMap()
          .map((index, tab) => MapEntry(
                index,
                CustomTab(
                  icon: tab.icon,
                  label: tab.label,
                  isSelected: index == authCtrl.tabController.index,
                ),
              ))
          .values
          .toList(),
    );
  }

  /// return screen content based on the selected tab
  Widget _buildTabContent() {
    switch (authCtrl.tabController.index) {
      case 0:
        return AccountTabContent();
      case 1:
        return PaymentTabContent();
      case 2:
        return LicenseTabContent();
      case 3:
        return FleetTabContent();
      default:
        return const SizedBox();
    }
  }
}
