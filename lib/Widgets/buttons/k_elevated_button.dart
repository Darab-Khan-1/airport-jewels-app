import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:jewels_airport_transfers/constants/color.dart';

class KElevatedButton extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String? text;
  const KElevatedButton(
      {super.key, this.height = 50, required this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [kWhiteColor, kWhiteColor],
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          text!,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 16, fontWeight: FontWeight.w500, color: kBlueColor),
        ),
      ),
    );
  }
}

class KElevatedButtons extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String text;
  const KElevatedButtons(
      {super.key,
      this.height = 50,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kdarkblueColor,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 18, fontWeight: FontWeight.w500, color: kWhiteColor),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String text;
  final String imagePath;
  const SocialButton(
      {super.key,
      this.height = 50,
      required this.onPressed,
      required this.text,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kgreenColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            const Gap(10),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor,
                    fontSize: 18,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClickButton extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String text;
  final String imagePath;
  const ClickButton(
      {super.key,
      this.height = 50,
      required this.onPressed,
      required this.text,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: kclickgroundColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            const Gap(10),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: kclickgroundColor,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlertButton extends StatelessWidget {
  final double height;
  final double width;
  final void Function()? onPressed;
  final String text;
  final String imagePath;
  const AlertButton(
      {super.key,
      this.height = 50,
      this.width = 150,
      required this.onPressed,
      required this.text,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: kGradient2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            const Gap(10),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: kGradient2,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypeButton extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String text;
  final String imagePath;
  const TypeButton(
      {super.key,
      this.height = 50,
      required this.onPressed,
      required this.text,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: kGradient2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath),
            const Gap(10),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: kGradient2,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class KElevatedButton1 extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String text;
  const KElevatedButton1(
      {super.key,
      this.height = 50,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: kBlueColor,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 18, fontWeight: FontWeight.w500, color: kWhiteColor),
        ),
      ),
    );
  }
}

class KElevatedButton2 extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String text;
  const KElevatedButton2(
      {super.key,
      this.height = 50,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kBlueColor,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 16, fontWeight: FontWeight.w700, color: kWhiteColor),
        ),
      ),
    );
  }
}

class KButton1 extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String text;
  const KButton1(
      {super.key,
      this.height = 50,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30,
        width: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: kBlueColor,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 80),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: 12, fontWeight: FontWeight.w500, color: kWhiteColor),
        ),
      ),
    );
  }
}
