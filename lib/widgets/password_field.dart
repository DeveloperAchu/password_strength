import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final controller;
  final cursorColor;
  final showIcon;
  final icon;

  PasswordField({
    @required this.controller,
    @required this.cursorColor,
    @required this.showIcon,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          // all the borders are set to be transparent color
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 2.0,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 2.0,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 2.0,
            ),
          ),
          suffixIcon: showIcon
              ? Image(
                  image: AssetImage(
                    icon,
                  ),
                  fit: BoxFit.cover,
                )
              : Container(),
          suffixIconConstraints: BoxConstraints(
            maxWidth: 20,
            maxHeight: 20,
          ),
        ),
        obscureText: true,
        autocorrect: false,
        obscuringCharacter: "*",
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => {
          FocusScope.of(context).unfocus(),
        },
        textAlignVertical: TextAlignVertical.top,
        cursorColor: cursorColor,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}
