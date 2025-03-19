import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Stack(
      children: [
        Positioned.fill(
          child: Dialog(
            backgroundColor: kTransparent,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      Assets.images.meta.path,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      successfullyAdded,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      driverSucessfullyAdded,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: kBlackColor, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: KElevatedButton2(
                        onPressed: () {
                          Get.back();
                        },
                        text: ok,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
