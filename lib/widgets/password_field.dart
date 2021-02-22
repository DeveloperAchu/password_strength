import 'package:flutter/material.dart';

/*
  This widget shows the password text field.
  
  Attributes and values:
    - decoration:   Default underline colors are set to be transparent. Also, 
                    if the showIcon parameter is true, the value of the icon
                    parameter is shown using AssetImage. Else, an empty container
                    is shown. Using the suffixIconConstraints, the maximum width
                    and height of the icon is set.
    - obscureText:  Set to true inorder to hide the text entered by the user.
    - autocorrect:  Set to false inorder to disable the autocorrect feature in
                    this input field.
    - obscuringCharacter: By default, the obscuring character is a bullet dot.
                          This attribute is set to change the character to
                          asterisk.
    - controller:   The controller passed as the widget parameter is set. This
                    gives the ability to monitor this controller from the home
                    page.
    - keyboardType: The keyboard type is set to visiblePassword. This brings the
                    letters and the numbers in a single keyboard layout.
    - textInputAction:  This controls the action button of the keyboard. This is
                        set to done.
    - onSubmitted:  The function declared here will be invoked when the user
                    submits the field using the soft keyboard.
    - cursorColor:  This attribute controls the color of the input field cursor.
                    The value is set to the color value passed as the widget
                    parameter.
    - style:        The style of the text is defined using this attribute.
*/

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
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 2.5,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 2.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 2.5,
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
        cursorColor: cursorColor,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}
