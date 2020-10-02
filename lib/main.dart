import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soochit/pages/authentication/register.dart';
import 'package:soochit/pages/authentication/enterOTP.dart';
import 'package:soochit/pages/authentication/splashScreen.dart';
import 'package:soochit/pages/doctor-specific/doctorProfile.dart';
import 'package:soochit/pages/doctor-specific/doctorRegistration.dart';
import 'package:soochit/pages/doctor-specific/homeDoctor.dart';
import 'package:soochit/pages/doctor-specific/prescription.dart';
import 'package:soochit/pages/patient-specific/homePatient.dart';
import 'package:soochit/pages/patient-specific/patientRegistration.dart';
import 'package:soochit/stores/login_store.dart';
import 'functions/localNotificationsScreen.dart';
import 'pages/welcome.dart';
import 'pages/login.dart';
import 'pages/doctor-specific/patientHistory.dart';
import 'pages/patient-specific/medicineDeadlines.dart';
import 'pages/patient-specific/prescriptionHistory.dart';
import 'pages/doctor-specific/samplePatientProfile.dart';


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
          // home: LocalNotificationScreen(),
          home: SplashScreen(),
          routes: {
            EnterOTP.id: (context) => EnterOTP(),
            Register.id: (context) => Register(),
            SplashScreen.id: (context) => SplashScreen(),
            Welcome.id: (context) => Welcome(),
            Login.id: (context) => Login(),
            PatientHistory.id: (context) => PatientHistory(),
            MedicineDeadlines.id: (context) => MedicineDeadlines(),
            PrescriptionHistory.id: (context) => PrescriptionHistory(),
            SamplePatientProfile.id: (context) => SamplePatientProfile(),
            HomePatient.id: (context) => HomePatient(),
            HomeDoctor.id: (context) => HomeDoctor(),
            DoctorProfile.id: (context) => DoctorProfile(),
            DoctorRegistration.id: (context) => DoctorRegistration(),
            PatientRegistration.id: (context) => PatientRegistration(),
            Prescription.id: (context) => Prescription(),
          },
        ),
      ),
    );
  }
}
