import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/Widgets/text_field/text_input_field.dart';
import '../../constants/color.dart'; // Assuming you have defined your color constants
import '../../constants/string.dart';
import '../buttons/custom_widgets.dart';
import '../buttons/leading_button.dart'; // Assuming your helper widgets are here

class QuotationDetailsCard extends StatelessWidget {
  const QuotationDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(quotationDetails),
        leading:
            const LeadingButton(), // Assuming this is your custom back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.directions_car,
                              text: saloon,
                              textColor: kBlackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.edit_note,
                              text: refrence,
                              data: data,
                              textColor: kBlackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      buildIconTextRow(
                        icon: Icons.radio_button_checked,
                        iconColor: kgreenColor,
                        text: pickUp,
                        data: locationA,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      buildIconTextRow(
                        icon: Icons.location_on,
                        iconColor: kRedColor,
                        text: dropOff,
                        data: locationB,
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.timeline,
                              text: approximate,
                              data: miles,
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.handshake,
                              text: meetAndGreet,
                              data: yes,
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.calendar_today,
                              text: date,
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.access_time,
                              text: time,
                              data: timeHours,
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            submitYourQuote,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: kBlackColor,
                            ),
                          ),
                          Spacer(),
                          Text(
                            guidePrice,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: kgreenColor,
                            ),
                          ),
                        ],
                      ),
                      const Gap(15),
                      TextInputFieldWidget(
                        hintText: quoteHere,
                        prefixIcon: Text(euro),
                      ),
                      const Gap(15),
                      FilledButton(
                        onPressed: () {
                          // Handle submit action
                        },
                        child: const Text(
                          submit,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Gap(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_box,
                            color: kPrimaryColor,
                          ),
                          const Gap(8),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: bySubmitingYourQuote,
                                style: const TextStyle(
                                  color: kBlackColor,
                                  fontSize: 14.0,
                                ),
                                children: [
                                  TextSpan(
                                    text: termsAndConditions,
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              const Card(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(jobInstructions),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
