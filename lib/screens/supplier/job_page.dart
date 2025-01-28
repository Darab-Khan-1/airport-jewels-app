import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/Widgets/text_field/text_input_field.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  final List<Map<String, String>> drivers = [
    {
      'name': 'William Parker',
      'email': 'willaimparker123@example.com',
      'phone': '123-456-7890',
      'image': 'assets/images/driver.jpeg',
      'amount': '4325',
    },
    {
      'name': 'Sarah Collins',
      'email': 'Sarahcollins234@example.com',
      'phone': '234-567-8901',
      'image': 'assets/images/driver.jpeg',
      'amount': '3500',
    },
    // Add more drivers here...
  ];

  int? selectedCardIndex;

  void assignDriver(String name, String fare) {
    // Logic for assigning a driver
    debugPrint('Assigned $name with fare $fare');
  }

  void deleteDriver(int index) {
    setState(() {
      drivers.removeAt(index);
      if (selectedCardIndex == index) selectedCardIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(pushJobDriver),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: drivers.length,
        itemBuilder: (_, index) {
          final driver = drivers[index];
          final isSelected = selectedCardIndex == index;

          return DriverCard(
            name: driver['name']!,
            email: driver['email']!,
            phone: driver['phone']!,
            image: driver['image']!,
            amount: driver['amount']!,
            isSelected: isSelected,
            onSelect: () {
              setState(() {
                selectedCardIndex = index;
              });
            },
            onDelete: () => deleteDriver(index),
            onAmountChange: (value) {
              drivers[index]['amount'] = value;
            },
            onAssign: () => assignDriver(
              driver['name']!,
              drivers[index]['amount']!,
            ),
          );
        },
      ),
    );
  }
}

class DriverCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String image;
  final String amount;
  final bool isSelected;
  final VoidCallback onSelect;
  final VoidCallback onDelete;
  final ValueChanged<String> onAmountChange;
  final VoidCallback onAssign;

  const DriverCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.amount,
    required this.isSelected,
    required this.onSelect,
    required this.onDelete,
    required this.onAmountChange,
    required this.onAssign,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: isSelected ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(image),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Email: $email',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'Phone: $phone',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                const Text("You can edit the driver fare you wish to assign for in the box below."),
                TextInputFieldWidget(
                  initialValue: amount,
                  prefixIcon: const Text(euro),
                  textInputType: TextInputType.number,
                  onChange: onAmountChange,
                ),
                const Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: onAssign,
                        child: const Text(assign),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: FilledButton(
                        onPressed: onDelete,
                        style:
                            Theme.of(context).filledButtonTheme.style?.copyWith(
                                  backgroundColor:
                                      const WidgetStatePropertyAll(kRedColor),
                                ),
                        child: const Text(deleteDriver),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
