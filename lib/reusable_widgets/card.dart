import 'package:flutter/material.dart';
import 'package:my_calculator_application/utils/constants/color.dart';
import 'package:my_calculator_application/utils/constants/sizes.dart';

class CalculatorCard extends StatelessWidget {
  const CalculatorCard({
    super.key, 
    required this.cardText, 
    required this.imageText, 
    this.onTap
  });

  final String cardText, imageText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CalculatorColors.blueLight
        ),
        height: 150,
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                imageText
              ),
              height: 40,
              width: 40,
            ),
      
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                cardText,
                style: const TextStyle(
                  color: CalculatorColors.black,
                  fontSize: CalculatorSizes.verySmallText,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}