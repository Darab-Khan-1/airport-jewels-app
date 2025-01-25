import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/constants/color.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            height: 40,
            width: 20,
            child: Transform.scale(
              scale: 0.9,
              child: Checkbox(
                checkColor: kBlackColor,
                value: value, // Using the value passed in constructor
                onChanged:
                    onChanged, // Using the callback passed in constructor
                activeColor: kWhiteColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: const BorderSide(
                  color: kBlackColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
        const Gap(15),
        Expanded(
          child: Text(
            label, // Using the label passed in constructor
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  decorationColor: kBlackColor,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor,
                ),
          ),
        ),
      ],
    );
  }
}
