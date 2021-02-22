import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: WHITE_COLOR,
          body: Center(
            child: Text(
              "Home page",
            ),
          ),
        ),
      ),
    );
  }
}
