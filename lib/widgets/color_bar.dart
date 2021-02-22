import 'package:flutter/material.dart';
import 'package:password_strength/utils/colors.dart';

/*
  This widget shows the underline of the password text field.
  The endColor parameter controls the gradient end color of the underline.
  The underline color is a gradient which starts with a blue shade. If the
  password entered by the user is a weak or medium password, the gradient end
  color will be of red shade. If the password is strong, the gradient end color
  will be of green shade. The endColor value is passed as the widget parameter.
*/

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
