import 'package:flutter/material.dart';
import 'pages/welcome.dart';
import 'pages/splash.dart';
import 'pages/login.dart';

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
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (context) => Welcome(),
        Splash.id: (context) => Splash(),
        Login.id: (context) => Login(),
      },
    );
  }
}
