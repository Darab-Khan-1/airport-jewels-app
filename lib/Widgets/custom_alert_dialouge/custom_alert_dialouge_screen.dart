import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/constants/color.dart';

import '../../constants/string.dart';
import '../../gen/assets.gen.dart';
import '../buttons/k_elevated_button.dart';

class CustomAlertDialogScreen extends StatefulWidget {
  const CustomAlertDialogScreen({super.key});

  @override
  CustomAlertDialogScreenState createState() => CustomAlertDialogScreenState();
}

class CustomAlertDialogScreenState extends State<CustomAlertDialogScreen> {
  @override
  Widget build(BuildContext context) {
    // Show dialog as soon as the widget is built
    Future.delayed(Duration.zero, () {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        barrierDismissible: false, // Prevent dismissing by tapping outside
        builder: (context) {
          return Dialog(
            backgroundColor:
                Colors.transparent, // Make the dialog background transparent
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white, // Set the content background to white
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image at the top-center
                  Container(
                    padding: const EdgeInsets.all(2),
                    child: Image.asset(
                      Assets.images.meta.path,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  // "Added Successfully" message at the center
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      added,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // "Driver has been successfully added" message below
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      sucessfully,
                      style: TextStyle(
                        fontSize: 15,
                        color: kBlackColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Gap(20),
                  // OK Button
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: KElevatedButtonTransparent(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      text: ok,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });

    return Scaffold(
      body: Center(
        child: Container(), // Empty body, since the dialog will be shown
      ),
    );
  }
}
