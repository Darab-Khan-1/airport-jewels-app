import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/constants/color.dart';
import 'package:jewels_airport_transfers/constants/string.dart';
import '../../Widgets/custom_tab/custom_tab.dart';
import '../../Widgets/tab_content/account_tab.dart';
import '../../Widgets/tab_content/fleet_tab.dart';
import '../../Widgets/tab_content/license_tab.dart';
import '../../Widgets/tab_content/payment_tab.dart';
import '../../Widgets/tab_content/personal_tab.dart';
import '../../controlller/registration_form_controller.dart';
import '../../models/tab_data/tab_data.dart';

class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationFormScreenState createState() => _RegistrationFormScreenState();
}

class _RegistrationFormScreenState extends State<RegistrationFormScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final controller = Get.put(RegistrationFormController());

  final List<TabData> _tabs = [
    TabData(icon: Icons.lock, label: account1),
    TabData(icon: Icons.credit_card, label: payment1),
    TabData(icon: Icons.badge_outlined, label: license),
    TabData(icon: Icons.directions_car, label: fleet1),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildInfoBox(),
          _buildTabBar(),
          _buildTabBarView(),
        ],
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
        registrartion,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildInfoBox() {
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
          text: form,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: kBlackColor, fontWeight: FontWeight.normal),
          children: [
            TextSpan(
              text: sale,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: kMainColor,
                  ),
            ),
            TextSpan(
              text: along,
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
      controller: _tabController,
      indicatorColor: kBlueColor,
      labelColor: kBlueColor,
      unselectedLabelColor: klightgreyColor,
      onTap: (_) => setState(() {}),
      tabs: _tabs
          .asMap()
          .map((index, tab) => MapEntry(
                index,
                CustomTab(
                  icon: tab.icon,
                  label: tab.label,
                  isSelected: _tabController.index == index,
                ),
              ))
          .values
          .toList(),
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: const [
          AccountTabContent(),
          PaymentTabContent(),
          LicenseTabContent(),
          FleetTabContent(),
        ],
      ),
    );
  }
}
