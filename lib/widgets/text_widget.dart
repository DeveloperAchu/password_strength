import 'package:flutter/material.dart';

import '../utils/colors.dart';

/*
  This widget shows the title of the input field.
*/

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "New password",
        style: TextStyle(
          fontSize: 15,
          color: GREY_COLOR,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
