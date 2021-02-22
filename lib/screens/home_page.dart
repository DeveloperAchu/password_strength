import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../static_files/password_strength.dart';

import '../widgets/text_widget.dart';
import '../widgets/password_field.dart';
import '../widgets/color_bar.dart';
import '../widgets/password_strength_text.dart';

import '../utils/colors.dart';
import '../utils/assets.dart';

/*
  This screen is the main screen of the app.
*/

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* 
    A text editing controller is declared and this will watch the password
    entered by the user.
    This is declared as final because this won't change later during the entire
    lifecycle of the app.
  */
  final _passwordController = TextEditingController();

  /*
    A color variable is declared to control the text field cursor color and the
    underline gradient end color.
  */
  Color _passwordCursorColor = STRONG_TEXT_COLOR;

  /*
    A string is declared to show the strength of the password. The different
    strengths are declared in a static file. The strength can be none, weak,
    medium, and strong. Since the user is not engaging with the input field,
    initially strength is declared as none.
  */
  String _passwordStrength = PasswordStrength.none;

  /*
    A boolean variable is declared to toggle the visibility of the password
    strength suffix icon. Since the user is not engaging with the input field,
    initially icon is hidden.
  */
  bool _showPasswordIcon = false;

  /* 
    A string variable is declared to dynamically change the url of the icon. The
    icon can be a success icon or an error icon. The url to these icon assets
    are declared in the assets file in the utils folder.
  */
  String _iconAsset;

  /*
    In the initState function, we add a listener function to the password text
    controller to handle the text entered by the user.
  */
  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_passwordTextChangeListener);
  }

  /*
    This is the listener function of the text editing controller.
    
    This function checks the number of characters in the string. If it is
    greater than or equal to 7, the password is marked as a strong password. If 
    the length is in between 4 and 7, it is marked as a medium password. If it
    is less than 4, it is marked as weak password.
  */
  void _passwordTextChangeListener() {
    Color updatedCursorColor;
    String strength;
    String icon;

    if (_passwordController.text.length >= 7) {
      /* 
        strong password.
        The strength of the password is marked as strong.
        The updated cursor color and the gradient end color is marked as a shade
        of green color.
        A success icon is attached as the suffix of the password field.
      */
      strength = PasswordStrength.strong;
      updatedCursorColor = STRONG_TEXT_COLOR;
      icon = SUCCESS_ICON;
    } else if (_passwordController.text.length > 4) {
      /* 
        medium password.
        The strength of the password is marked as medium.
        The updated cursor color and the gradient end color is marked as a shade
        of red color.
        An error icon is attached as the suffix of the password field.
      */
      strength = PasswordStrength.medium;
      updatedCursorColor = WEAK_TEXT_COLOR;
      icon = ERROR_ICON;
    } else {
      /* 
        weak password.
        The strength of the password is marked as medium.
        The updated cursor color and the gradient end color is marked as a shade
        of red color.
        An error icon is attached as the suffix of the password field.
      */
      strength = PasswordStrength.weak;
      updatedCursorColor = WEAK_TEXT_COLOR;
      icon = ERROR_ICON;
    }

    /* 
      All the above changes are rebuit by invoking the setState function
    */
    setState(() {
      _passwordStrength = strength;
      _passwordCursorColor = updatedCursorColor;
      _showPasswordIcon = true;
      _iconAsset = icon;
    });
  }

  /*
    This function clears all the variables to the default or initial value. This
    function is invoked when the user tap on the screen. The changes are rebuilt
    by invoking the setState function.
  */
  void _clearFields() {
    FocusScope.of(context).unfocus();
    setState(() {
      _passwordController.text = "";
      _passwordStrength = PasswordStrength.none;
      _passwordCursorColor = STRONG_TEXT_COLOR;
      _showPasswordIcon = false;
      _iconAsset = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: _clearFields,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: WHITE_COLOR,
            body: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(),
                  PasswordField(
                    controller: _passwordController,
                    cursorColor: _passwordCursorColor,
                    showIcon: _showPasswordIcon,
                    icon: _iconAsset,
                  ),
                  ColorBar(
                    endColor: _passwordCursorColor,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: PasswordStrengthText(
                      text: _passwordStrength,
                      textColor: _passwordCursorColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
