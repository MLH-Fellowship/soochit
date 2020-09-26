import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soochit/pages/authentication/home_page.dart';
import 'package:soochit/pages/authentication/login_page.dart';
import 'package:soochit/pages/authentication/otp_page.dart';
import 'package:soochit/pages/authentication/splash_page.dart';
import 'package:soochit/stores/login_store.dart';
import 'pages/welcome.dart';
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
            OtpPage.id: (context) => OtpPage(),
            LoginPage.id: (context) => LoginPage(),
            SplashPage.id: (context) => SplashPage(),
            HomePage.id: (context) => HomePage(),
            Welcome.id: (context) => Welcome(),
            Login.id: (context) => Login(),
          },
        ),
      ),
    );
  }
}
