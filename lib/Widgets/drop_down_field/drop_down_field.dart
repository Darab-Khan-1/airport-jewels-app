import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';

class TitleDropdownFilter extends StatelessWidget {
  final String title;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const TitleDropdownFilter({
    Key? key,
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? dropdownValue = items.any((item) => item == value) ? value : null;

    debugPrint('${'Dropdown Value:'.tr}$dropdownValue');
    debugPrint('Available Items: ${items.map((e) => e).toList()}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Gap(4),
        DropdownButtonFormField<String>(
          value: dropdownValue,
          isExpanded: true,
          hint: Text('${'Select'.tr} $title'),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: kBlackColor),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item ?? '',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: kBlackColor),
              ),
            );
          }).toList(),
          validator: validator,
          onChanged: (newValue) {
            debugPrint('Selected Value: $newValue');
            onChanged(newValue);
          },
          icon: const Icon(Icons.arrow_drop_down, color: kBlackColor),
          dropdownColor: Colors.white,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
