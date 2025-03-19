import 'package:flutter/material.dart';
import '../../constants/color.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      color: kWhiteColor,
      child: ListTile(
        leading: Icon(icon, color: Colors.black54),
        title: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: kBlackColor),
        ),
      ),
    );
  }
}
