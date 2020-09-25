import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static String id = "splash";
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(), // customise this Scaffold to add a splash page later on!
    );
  }
}
