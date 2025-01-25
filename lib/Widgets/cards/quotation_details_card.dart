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
        title: const Text("Quotation Details"),
        leading: LeadingButton(), // Assuming this is your custom back button
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
                              text: "Saloon",
                              textColor: kBlackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.edit_note,
                              text: "Ref:",
                              data: "098937587623",
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
                        text: "Pickup:",
                        data: "Location A",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      buildIconTextRow(
                        icon: Icons.location_on,
                        iconColor: kRedColor,
                        text: "Drop-off:",
                        data: "Location B",
                        textColor: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.timeline,
                              text: "Approx:",
                              data: "25 Miles",
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.handshake,
                              text: "Meet & Greet:",
                              data: "Yes",
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
                              text: "Date:",
                              data: "17 July 2025",
                              textColor: kBlackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: buildIconTextRow(
                              icon: Icons.access_time,
                              text: "Time:",
                              data: "10:00 AM",
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
                      Row(
                        children: [
                          Text(
                            "Submit Your Quote:",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: kBlackColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Guide Price £76.00",
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
                        hintText: "Quote Here",
                        prefixText: "£ ",
                      ),
                      Gap(15),

                      FilledButton(
                        onPressed: () {
                          // Handle submit action
                        },
                        child: const Text(
                          "Submit",
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
                                text: "By submitting your quote, you are accepting the Jewels Airport Transfers ",
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 14.0,
                                ),
                                children: [
                                  TextSpan(
                                    text: "terms and conditions",
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
              Gap(20),
              Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(jobInstructions),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
