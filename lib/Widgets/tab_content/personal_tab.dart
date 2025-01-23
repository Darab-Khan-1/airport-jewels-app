import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/color.dart';
import '../../constants/string.dart';
import '../buttons/k_elevated_button.dart';
import '../text_field/text_input_field.dart';

class PersonalTabContent extends StatelessWidget {
  const PersonalTabContent({
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
              contact,
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
                  hintText: name2,
                  cursorsColor: kBlackColor,
                  lable: null,
                ),
              ),
              const Gap(20),
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
              const Gap(20),
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
                  hintText: mobileNumber1,
                  cursorsColor: kBlackColor,
                  textInputType: TextInputType.phone,
                ),
              ),
              const Gap(20),
              Align(
                alignment: Alignment.center,
                child: KElevatedButton1(
                  onPressed: () {},
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
