import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../buttons/k_elevated_button.dart';
import '../text_field/text_input_field.dart';

class AccountTabContent extends StatelessWidget {
  const AccountTabContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft, // Aligns the text to the left
            child: Text(
              account,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name1,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(8),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: klightgreyColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextInputFieldWidget(
                  hintText: name1,
                  cursorsColor: kBlackColor,
                ),
              ),
              const Gap(10),
              Text(
                email,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(8),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: klightgreyColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextInputFieldWidget(
                  hintText: email2,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              const Gap(10),
              Text(
                mobileNumber1,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(8),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: klightgreyColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextInputFieldWidget(
                  hintText: mobileNumber2,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.phone,
                ),
              ),
              const Gap(10),
              RichText(
                text: TextSpan(
                  text: form,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: kBlackColor, fontWeight: FontWeight.normal),
                  children: [
                    TextSpan(
                      text: sale,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: kMainColor,
                          ),
                    ),
                    TextSpan(
                      text: along,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: kBlackColor, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              Align(
                alignment: Alignment.center,
                child: KElevatedButton1(
                  onPressed: () {
                    // Add driver logic here
                  },
                  text: next,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
