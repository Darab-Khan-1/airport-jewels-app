import 'package:flutter/material.dart';
import 'package:jewels_airport_transfers/constants/color.dart';

class RightSideSlider extends StatefulWidget {
  const RightSideSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RightSideSliderState createState() => _RightSideSliderState();
}

class _RightSideSliderState extends State<RightSideSlider> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        // Prevents scrolling while using the slider
        child: Container(
          padding: const EdgeInsets.only(right: 4.0),
          height: double.infinity,
          child: RotatedBox(
            quarterTurns: 3,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 6.5,
                thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 0), // Hides the thumb
                overlayShape:
                    SliderComponentShape.noOverlay, // Removes overlay effect
              ),
              child: Slider(
                value: _currentValue,
                min: 0,
                max: 25,
                // Set max to 20 to limit the fill color to this range
                activeColor: kBlueColor,
                inactiveColor: kGradient2,
                onChanged: (value) {
                  setState(() {
                    _currentValue =
                        value.clamp(0.0, 10.0); // Clamp the value to the range
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
