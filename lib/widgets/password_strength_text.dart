import 'package:flutter/material.dart';

class PasswordStrengthText extends StatelessWidget {
  final text;
  final textColor;

  PasswordStrengthText({
    @required this.text,
    @required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: textColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
