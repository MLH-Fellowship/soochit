import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/pages/authentication/signout-function.dart';
import 'package:soochit/pages/authentication/splashScreen.dart';
import 'package:soochit/pages/doctor-specific/patientHistory.dart';
import 'package:soochit/pages/doctor-specific/doctorProfile.dart';
import 'package:soochit/widgets/addPatientDialog.dart';

class HomeDoctor extends StatefulWidget {
  static String id = "homeDoctor";
  FirebaseUser user;

  HomeDoctor({Key key, @required this.user}) : super(key: key);
  @override
  _HomeDoctorState createState() => _HomeDoctorState(user: user);
}

class _HomeDoctorState extends State<HomeDoctor> {

  FirebaseUser user;
  _HomeDoctorState({Key key, @required this.user});

  int pageIndex = 0;
  int firstIconColorInt = 0;
  int secondIconColorInt = 1;
  List _currentPage = [PatientHistory(), DoctorProfile()];
  List _iconColors = [MyColors.white, MyColors.lightPink];

  @override
  Widget build(BuildContext context) {
    void handleClick(String value) {
      switch (value) {
        case 'Logout':
          Auth.logout();
          Navigator.pushNamed(context, SplashScreen.id);
      }
    }
    return Scaffold(
      body: _currentPage[pageIndex],
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: MyDimens.double_10),
            child: PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: MyDimens.double_60,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MyDimens.double_60),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.history,
                    color: _iconColors[firstIconColorInt],
                  ),
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                      firstIconColorInt = 0;
                      secondIconColorInt = 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person,
                      color: _iconColors[secondIconColorInt]),
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                      firstIconColorInt = 1;
                      secondIconColorInt = 0;
                    });
                  },
                ),
              ],
            ),
          ),
          color: MyColors.primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddPatientDialog();
        },
        backgroundColor: MyColors.primaryColor,
        child: Icon(Icons.add, size: 40),
      ),
    );
  }
  Future<Dialog> showAddPatientDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AddPatientDialog());
  }
}
