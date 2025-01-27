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
              TextInputFieldWidget(
                hintText: name1,
                isLableRequired: true,
                title: name1,
                cursorsColor: kBlackColor,
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: businessName,
                title: businessName,
                isLableRequired: true,
                cursorsColor: kBlackColor,
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: enterEmail,
                title: email,
                isLableRequired: true,
                cursorsColor: kBlackColor,
                textInputType: TextInputType.emailAddress,
              ),
              const Gap(10),
              TextInputFieldWidget(
                hintText: enterMobileNumber,
                title: mobileNumber,
                isLableRequired: true,
                cursorsColor: kBlackColor,
                textInputType: TextInputType.phone,
              ),
              const Gap(10),
              RichText(
                text: TextSpan(
                  text: pleaseFillForm,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: kBlackColor, fontWeight: FontWeight.normal),
                  children: [
                    TextSpan(
                      text: saleJewelsAirport,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: kMainColor,
                          ),
                    ),
                    TextSpan(
                      text: alongWithCopies,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: kBlackColor, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              FilledButton(
                onPressed: () {
                  // Add driver logic here
                },
                child: Text(next),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
