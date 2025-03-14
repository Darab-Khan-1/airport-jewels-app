import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/Widgets/form_validation/form_validation.dart';
import 'package:jewels_airport_transfers/Widgets/text_field/text_input_field.dart';
import 'package:jewels_airport_transfers/constants/extension.dart';
import '../../../Widgets/text_field/intl_phone_field.dart';
import '../../../constants/color.dart';
import '../../../constants/string.dart';
import '../../../controlller/auth_controller/auth_controller.dart';
import '../../../custom_bg_screen.dart';
import '../../../gen/assets.gen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController controller = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        unfocusKeyboard(context);
      },
      child: CustomBgScreen(
        child: SingleChildScrollView(
          child: SizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLogo(context),
                    _buildHeaderTexts(context),
                    const Gap(20),
                    _buildSelectionOptions(context),

                    Obx(() => controller.selectedOption.value == "Email"?
                    _buildLoginWithEmail(context):
                    _buildPhoneInput(),),
                    const Gap(10),
                    _buildCheckbox(context),
                    const Gap(15),
                    // _buildDigitsText(context),
                    // const Gap(40),
                    _buildNextButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the Logo at the top
  Widget _buildLogo(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.images.jewelsLogo1.path,
        width: context.screenWidth * 0.5,
      ),
    );
  }

  /// Builds Welcome Text & Sign-in Subtitle
  Widget _buildHeaderTexts(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            welcomeBack,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: kWhiteColor,
            ),
          ),
        ),
        const Gap(2),
        Center(
          child: Text(
            signInToContinue,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: kWhiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the Email/Mobile selection options
  Widget _buildSelectionOptions(BuildContext context) {
    return Obx(
          () => Row(
        children: [
          _buildRadioOption(context, "Email"),
          _buildRadioOption(context, "Mobile"),
        ],
      ),
    );
  }

  /// Reusable method for RadioListTile
  Widget _buildRadioOption(BuildContext context, String value) {
    return Flexible(
      child: RadioListTile<String>(
        title: Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: kWhiteColor,
          ),
        ),
        value: value,
        activeColor: kMainColor,
        groupValue: controller.selectedOption.value,
        onChanged: (newValue) => controller.selectedOption.value = newValue!,
      ),
    );
  }

  /// Builds the Phone Input Field
  Widget _buildPhoneInput() {
    return PhoneInputField(
      initialCountryCode: "GB",
      fillColor: kTransparent,
      readOnly: false,
      onChanged: (completeNumber) {
        log("Complete phone number: $completeNumber");
      },
      onCountryChanged: (country) {
        log(country.code.toString());
      },
    );
  }

  /// Builds the Keep Login Checkbox
  Widget _buildCheckbox(BuildContext context) {
    return Obx(
          () => Row(
        children: [
          Checkbox(
            checkColor: Colors.black,
            value: controller.keepMeLogin.value,
            onChanged: (value) => controller.toggleCheckbox(),
            activeColor: kWhiteColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: const BorderSide(color: kWhiteColor, width: 2),
          ),
          Text(
            keepLogin,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: kWhiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the "Digits" Information Text
  Widget _buildDigitsText(BuildContext context) {
    return Text(
      digits,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: kWhiteColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }

Widget _buildLoginWithEmail(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputFieldWidget(
          controller: controller.emailController.value,
          hintText: enterEmail,
          validators: emailValidator().call,
        ),
        const Gap(10),
        TextInputFieldWidget(
          controller: controller.passwordController.value,
          hintText: "Enter Password",
          validators: passwordValidator().call,
        ),
      ],
    );
}

  /// Builds the Next Button
  Widget _buildNextButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if(_formKey.currentState?.validate() ?? false){
          unfocusKeyboard(context);
          controller.login(context);
        }
      },
      child: const Text(next),
    );
  }
}
