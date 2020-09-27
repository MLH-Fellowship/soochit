import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soochit/pages/authentication/signout.dart';
import 'package:soochit/pages/authentication/register.dart';
import 'package:soochit/pages/authentication/enterOTP.dart';
import 'package:soochit/pages/authentication/splash_page.dart';
import 'package:soochit/stores/login_store.dart';
import 'pages/welcome.dart';
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
    return MultiProvider(
      providers: [
        Provider<LoginStore>(
          create: (_) => LoginStore(),
        )
      ],
      child: GestureDetector(
        // This ensures that the keyboard disappears as soon as the user clicks outside the text filed
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: MaterialApp(
          title: 'Soochit',
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
          routes: {
            EnterOTP.id: (context) => EnterOTP(),
            Register.id: (context) => Register(),
            SplashPage.id: (context) => SplashPage(),
            HomePage.id: (context) => HomePage(),
            Welcome.id: (context) => Welcome(),
            Login.id: (context) => Login(),
            HomeDoctor.id: (context) => HomeDoctor(),
            HomePatient.id: (context) => HomePatient(),
            PrescriptionHistory.id: (context) => PrescriptionHistory(),
          },
        ),
      ),
    );
  }
}
