import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/pages/doctor-specific/doctorRegistration.dart';
import 'package:soochit/pages/patient-specific/patientRegistration.dart';

List<String> userType = ['Doctor', 'Patient'];
List<Color> backgroundColor = [MyColors.lightestPink, MyColors.lightestPink];
List<Color> textColor = [MyColors.black, MyColors.black];
String selectedRole;

class Welcome extends StatefulWidget {
  static String id = "welcome";
  FirebaseUser user;

  Welcome({Key key, @required this.user}) : super(key: key);
  @override
  _WelcomeState createState() => _WelcomeState(user: user);
}

class _WelcomeState extends State<Welcome> {
  FirebaseUser user;

  _WelcomeState({Key key, @required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: MyColors.primaryColor,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: MyDimens.double_100),
                child: Column(
                  children: [
                    Text(
                      MyStrings.welcomeToLabel,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: MyColors.lighterPink,
                          fontFamily: 'airbnb',
                          fontSize: 30),
                    ),
                    Text(MyStrings.appName,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            color: MyColors.white, fontFamily: 'airbnb')),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MyDimens.double_negative_300,
            right: MyDimens.double_negative_200,
            child: Container(
              height: MyDimens.double_600,
              width: MyDimens.double_600,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: MyDimens.double_100,
            left: MyDimens.double_10,
            right: MyDimens.double_10,
            child: Container(
              height: MyDimens.double_300,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: MyDimens.double_20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MyDimens.double_10)),
                elevation: MyDimens.double_7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MyDimens.double_30),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: MyDimens.double_20),
                          child: Align(
                            child: Text(MyStrings.whoAreYouLabel,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: MyColors.primaryColor,
                                        fontFamily: 'lexenddeca')),
                            alignment: Alignment.centerLeft,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: MyDimens.double_2point5),
                        child: Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: MyDimens.double_10,
                                      horizontal: MyDimens.double_20),
                                  onPressed: () {
                                    setState(() {
                                      if (backgroundColor[0] ==
                                          MyColors.lightestPink) {
                                        backgroundColor[0] =
                                            MyColors.primaryColor;
                                        textColor[0] = MyColors.white;
                                        backgroundColor[1] =
                                            MyColors.lightestPink;
                                        textColor[1] = MyColors.black;
                                        selectedRole = userType[0];
                                      } else {
                                        selectedRole = null;
                                        backgroundColor[0] =
                                            MyColors.lightestPink;
                                        textColor[0] = MyColors.black;
                                      }
                                    });
                                  },
                                  color: backgroundColor[0],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MyDimens.double_7)),
                                  child: Align(
                                    child: Text(MyStrings.doctorLabel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                                color: textColor[0],
                                                fontFamily: 'lexenddeca')),
                                    alignment: Alignment.centerLeft,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: MyDimens.double_2point5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: MyDimens.double_10,
                                            horizontal: MyDimens.double_20),
                                        onPressed: () {
                                          setState(() {
                                            if (backgroundColor[1] ==
                                                MyColors.lightestPink) {
                                              backgroundColor[1] =
                                                  MyColors.primaryColor;
                                              textColor[1] = MyColors.white;
                                              backgroundColor[0] =
                                                  MyColors.lightestPink;
                                              textColor[0] = MyColors.black;
                                              selectedRole = userType[1];
                                            } else {
                                              selectedRole = null;
                                              backgroundColor[1] =
                                                  MyColors.lightestPink;
                                              textColor[1] = MyColors.black;
                                            }
                                          });
                                        },
                                        color: backgroundColor[1],
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MyDimens.double_7)),
                                        child: Align(
                                          child: Text(MyStrings.patientLabel,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .copyWith(
                                                      color: textColor[1],
                                                      fontFamily:
                                                          'lexenddeca')),
                                          alignment: Alignment.centerLeft,
                                        )),
                                  ),
                                ],
                              ),
                              MySpaces.vSmallGapInBetween,
                              Visibility(
                                visible: (selectedRole != null),
                                child: InkWell(
                                  child: Align(
                                    child: Icon(
                                      CupertinoIcons.check_mark_circled_solid,
                                      size: MyDimens.double_40,
                                      color: MyColors.primaryColor,
                                    ),
                                    alignment: Alignment.centerRight,
                                  ),
                                  onTap: () {
                                    if(selectedRole==userType[0])
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (_) => DoctorRegistration(user: user)));
                                    else
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (_) => PatientRegistration(user: user)));
                                  },
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
