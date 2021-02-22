import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/colors.dart';

import 'screens/home_page.dart';

/*
  This is the entry point of the app.
*/
void main() {
  // Ensures all the necessary flutter bindings are made
  WidgetsFlutterBinding.ensureInitialized();
  // Locking the device orientation to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(PasswordStrength());
}

class PasswordStrength extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: WHITE_COLOR,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
