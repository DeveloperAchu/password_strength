import 'package:flutter/material.dart';
import 'package:password_strength/utils/colors.dart';

class ColorBar extends StatelessWidget {
  final endColor;

  ColorBar({
    @required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MEDIUM_TEXT_COLOR,
            endColor,
          ],
        ),
        borderRadius: BorderRadius.circular(
          3.5,
        ),
      ),
    );
  }
}
