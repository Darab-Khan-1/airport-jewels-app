import 'package:flutter/material.dart';
import 'package:jewels_airport_transfers/constants/color.dart';

class DeleteAccountDialog extends StatelessWidget {
  final VoidCallback onConfirm; // Delete function

  const DeleteAccountDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Fit content size
          children: [
            const Icon(Icons.warning_rounded,
                size: 50, color: Colors.red), // Warning icon
            const SizedBox(height: 10),
            const Text(
              "Delete Account?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Are you sure you want to delete your account? This action cannot be undone.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ❌ Cancel Butto
                TextButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.cancel_rounded, color: Colors.grey),
                  label: const Text(
                    "Cancel",
                    style: TextStyle(color: kWhiteColor),
                  ),
                ),
                // 🗑 Delete Button
                TextButton.icon(
                  onPressed: () {
                    // Close dialog
                    onConfirm(); // Call delete function
                  },
                  icon: const Icon(Icons.delete, color: kGreyColor),
                  label: const Text(
                    "Delete",
                    style: TextStyle(color: kWhiteColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
