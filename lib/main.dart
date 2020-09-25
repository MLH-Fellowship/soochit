import 'package:flutter/material.dart';
import 'pages/welcome.dart';
import 'pages/splash.dart';
import 'pages/login.dart';
import 'pages/doctor-specific/homeDoctor.dart';
import 'pages/patient-specific/homePatient.dart';
import 'pages/patient-specific/prescriptionHistory.dart';

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
      initialRoute: PrescriptionHistory.id,
      routes: {
        Welcome.id: (context) => Welcome(),
        Splash.id: (context) => Splash(),
        Login.id: (context) => Login(),
        HomeDoctor.id: (context) => HomeDoctor(),
        HomePatient.id: (context) => HomePatient(),
        PrescriptionHistory.id: (context) => PrescriptionHistory()
      },
    );
  }
}
