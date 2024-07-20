import 'package:flutter/material.dart';

class CalculatedText extends StatelessWidget {
  const CalculatedText({
    super.key, 
    required this.text, 
    required this.txtColor, 
    required this.backgroundColor, 
    required this.fontSize, 
    required this.fontWeight
  });

  final double fontSize;
  final String text;
  final Color txtColor, backgroundColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: txtColor
          ),
        ),
      ),
    );
  }
}