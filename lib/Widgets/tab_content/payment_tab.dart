import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../buttons/k_elevated_button.dart';
import '../text_field/text_input_field.dart';

class PaymentTabContent extends StatelessWidget {
  const PaymentTabContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft, // Aligns the text to the left
            child: Text(
              bank,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              TextInputFieldWidget(
                hintText: accountHolder,
                title: name1,
                isLableRequired: true,
                cursorsColor: kBlackColor,
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: idcard,
                title: id,
                isLableRequired: true,
                cursorsColor: kBlackColor,
                textInputType: TextInputType.emailAddress,
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: account2,
                title: account1,
                isLableRequired: true,
                cursorsColor: kBlackColor,
                textInputType: TextInputType.phone,
              ),
              const Gap(30),
              Align(
                alignment: Alignment.center,
                child: FilledButton(
                  onPressed: () {
                    // Add driver logic here
                  },
                  child: Text(next,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
