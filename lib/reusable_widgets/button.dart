import 'package:flutter/material.dart';
import 'package:my_calculator_application/utils/constants/color.dart';

class Button extends StatelessWidget {
  const Button({
    super.key, 
    required this.buttonTxt, 
    this.icon, 
    required this.textColor, 
    required this.backgroundColor, 
    required this.onPressed, 
    this.iconColor, 
    required this.top, 
    required this.left, 
    required this.bottom, 
    required this.right
  });

  final double top, left, bottom, right;
  final String buttonTxt;
  final IconData? icon;
  final Color textColor, backgroundColor; 
  final Color? iconColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
        backgroundColor: backgroundColor
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  icon,
                  color: iconColor,
                ) 
              ),
        
            Text(
              buttonTxt,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: CalculatorColors.white
              ),
            )
          ],
        ),
      )
    );
  }
}