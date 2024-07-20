import 'package:flutter/material.dart';
import 'package:my_calculator_application/utils/constants/color.dart';

class CalculatorSlider extends StatelessWidget {
  const CalculatorSlider({
    super.key,
    required this.value, 
    required this.min, 
    required this.max, 
    required this.activeColor, 
    required this.onChanged
  });

  final double value, min, max;
  final Color activeColor;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Slider(
        value: value, 
        onChanged: onChanged,
        min: min,
        max: max,
        activeColor: activeColor,
        thumbColor: CalculatorColors.white,
      )
    );
  }
}