import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:password_strength/widgets/color_bar.dart';

import '../static_files/password_strength.dart';

import '../widgets/text_widget.dart';
import '../widgets/password_field.dart';
import '../widgets/password_strength_text.dart';

import '../utils/colors.dart';
import '../utils/assets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _passwordController = TextEditingController();
  Color _passwordCursorColor = STRONG_TEXT_COLOR;
  String _passwordStrength = PasswordStrength.none;
  bool _showPasswordIcon = false;
  String _iconAsset;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_passwordTextChangeListener);
  }

  void _passwordTextChangeListener() {
    Color newColor;
    String strength;
    String icon;

    if (_passwordController.text.length >= 7) {
      // strong password
      strength = PasswordStrength.strong;
      newColor = STRONG_TEXT_COLOR;
      icon = SUCCESS_ICON;
    } else if (_passwordController.text.length > 4) {
      // medium strong password
      strength = PasswordStrength.medium;
      newColor = WEAK_TEXT_COLOR;
      icon = ERROR_ICON;
    } else {
      // weak password
      strength = PasswordStrength.weak;
      newColor = WEAK_TEXT_COLOR;
      icon = ERROR_ICON;
    }

    setState(() {
      _passwordStrength = strength;
      _passwordCursorColor = newColor;
      _showPasswordIcon = true;
      _iconAsset = icon;
    });
  }

  void _clearFields() {
    FocusScope.of(context).unfocus();
    setState(() {
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
