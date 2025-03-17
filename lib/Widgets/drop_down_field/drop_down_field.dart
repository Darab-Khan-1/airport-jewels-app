import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';

class DropdownFilter extends StatelessWidget {
  final String title;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const DropdownFilter({
    Key? key,
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged, this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? dropdownValue = items.any((item) => item == value)
        ? value
        : null;

    debugPrint('${'Dropdown Value:'.tr}$dropdownValue');
    debugPrint('Items: ${items.map((e) => e).toList()}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelMedium,
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
          items: items.map(( item) {
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


class MultiSelectDropdownFormField extends StatefulWidget {
  final String title;
  final List<String> items;
  final List<String> selectedItems;
  final ValueChanged<List<String>> onChanged;

  const MultiSelectDropdownFormField({
    Key? key,
    required this.title,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
  }) : super(key: key);

  @override
  _MultiSelectDropdownFormFieldState createState() => _MultiSelectDropdownFormFieldState();
}

class _MultiSelectDropdownFormFieldState extends State<MultiSelectDropdownFormField> {
  List<String> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.selectedItems);
  }

  void _openBottomSheet() async {
    List<String>? result = await showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return MultiSelectBottomSheet(
          items: widget.items,
          selectedItems: _selectedItems,
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedItems = result;
      });
      widget.onChanged(_selectedItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 4),
        InkWell(
          onTap: _openBottomSheet,
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedItems.isNotEmpty
                        ? _selectedItems.join(', ')
                        : 'Select ${widget.title}'.tr,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MultiSelectBottomSheet extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;

  const MultiSelectBottomSheet({
    Key? key,
    required this.items,
    required this.selectedItems,
  }) : super(key: key);

  @override
  _MultiSelectBottomSheetState createState() => _MultiSelectBottomSheetState();
}

class _MultiSelectBottomSheetState extends State<MultiSelectBottomSheet> {
  List<String> _tempSelectedItems = [];

  @override
  void initState() {
    super.initState();
    _tempSelectedItems = List.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.5,
      maxChildSize: 0.8,
      minChildSize: 0.3,
      builder: (_, controller) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text('Select Options'.tr, style: Theme.of(context).textTheme.titleMedium),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return CheckboxListTile(
                    title: Text(item),
                    value: _tempSelectedItems.contains(item),
                    onChanged: (bool? selected) {
                      setState(() {
                        if (selected == true) {
                          _tempSelectedItems.add(item);
                        } else {
                          _tempSelectedItems.remove(item);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'.tr),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, _tempSelectedItems),
                    child: Text('Done'.tr),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}



