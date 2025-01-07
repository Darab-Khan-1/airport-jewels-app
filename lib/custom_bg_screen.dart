import 'package:flutter/material.dart';

import 'constants/color.dart';
import 'gen/assets.gen.dart';

class CustomBgScreen extends StatelessWidget {
  final Widget child;
  const CustomBgScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          kTransparent, // Use Colors.transparent instead of kTransparent
      body: Stack(
        fit:
            StackFit.expand, // Ensures that the Stack fills the available space
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.images.background.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(child: child), // Add the child widget here
        ],
      ),
    );
  }
}
