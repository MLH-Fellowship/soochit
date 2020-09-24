import 'package:flutter/material.dart';
import 'package:soochit/pages/roleSelectionPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // the main here will have a 'splash' as home-screen and other routes
    return MaterialApp(
      title: 'Soochit',
      debugShowCheckedModeBanner: false,
      // home: SplashPage(), //uncomment after auth works
      home: RoleSelectionPage(),
    );
  }
}
