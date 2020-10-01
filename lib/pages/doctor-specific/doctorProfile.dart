import 'package:flutter/material.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorProfile extends StatefulWidget {
  static String id = "doctorProfile";
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  String hospitalAddress;
  String hospitalName;
  String doctorName;
  String doctorPhoneNumber;
  String doctorQualification;

  Future<String> getDoctorDetails() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    String userUID = firebaseUser.uid;
    Firestore.instance
        .collection('Doctor')
        .document(userUID)
        .get()
        .then((value) {
      hospitalAddress = value.data['hospitalAddress'];
      hospitalName = value.data['hospitalName'];
      doctorName = value.data['name'];
      doctorPhoneNumber = value.data['phoneNumber'];
      doctorQualification = value.data['qualification'];
      print(hospitalAddress);
      print(userUID);
    });

  }


  @override
  Widget build(BuildContext context) {
    getDoctorDetails();
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(MyDimens.double_30),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MySpaces.vMediumGapInBetween,
                            Text(
                              doctorName,
                              style: Theme.of(context).textTheme.headline4.copyWith(
                                  color: MyColors.primaryColor,
                                  fontFamily: 'airbnb'),
                            ),
                            MySpaces.vSmallGapInBetween,
                            Text(
                              MyStrings.phoneNumberLabel + ":",
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  color: MyColors.grey, fontFamily: 'lexenddeca'),
                            ),
                            Text(
                              doctorPhoneNumber,
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                  color: MyColors.black, fontFamily: 'lexenddeca'),
                            ),
                            MySpaces.vSmallGapInBetween,
                            Text(
                              MyStrings.hospitalNameLabel + ":",
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  color: MyColors.grey, fontFamily: 'lexenddeca'),
                            ),
                            Text(
                              hospitalName,
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                  color: MyColors.black, fontFamily: 'lexenddeca'),
                            ),
                            MySpaces.vSmallGapInBetween,
                            Text(
                              MyStrings.hospitalAddressLabel + ":",
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  color: MyColors.grey, fontFamily: 'lexenddeca'),
                            ),
                            Text(
                              hospitalAddress,
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                  color: MyColors.black, fontFamily: 'lexenddeca'),
                            ),
                            MySpaces.vSmallGapInBetween,
                            Text(
                              MyStrings.signatureLabel + ":",
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  color: MyColors.grey, fontFamily: 'lexenddeca'),
                            ),
                            Text(
                              'TODO',
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                  color: MyColors.black, fontFamily: 'lexenddeca'),
                            ),
                            MySpaces.vSmallGapInBetween,
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
