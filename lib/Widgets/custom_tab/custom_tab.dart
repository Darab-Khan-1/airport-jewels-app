import 'package:flutter/material.dart';
import 'package:jewels_airport_transfers/constants/color.dart';

class CustomTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const CustomTab({
    required this.icon,
    required this.label,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: CircleAvatar(
        radius: 20,
        backgroundColor: isSelected ? kBlueColor : kGradient2,
        child: Icon(icon, size: 25, color: kWhiteColor),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 9.8,
          color: kBlackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
