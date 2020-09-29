import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/pages/authentication/signout.dart';

// Patient's details -> now in array
// String name;
// String hospitalName;
// String hospitalAddress;
// String qualifications;

List<String> patientDetails = ['', '', '', ''];
List<String> textWidgetPlaceholders = [
  MyStrings.nameLabel,
  MyStrings.ageLabel,
  MyStrings.genderLabel,
  MyStrings.addressLabel,
];

class PatientRegistration extends StatefulWidget {
  @override
  static String id = 'patientRegistration';
  FirebaseUser user;

  PatientRegistration({Key key, @required this.user}) : super(key: key);

  @override
  _PatientRegistrationState createState() => _PatientRegistrationState(user: user);
}

class _PatientRegistrationState extends State<PatientRegistration> {
  FirebaseUser user;

  _PatientRegistrationState({Key key, @required this.user});

  void _onPressedAddDocDetails() async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection('Patient').document(firebaseUser.uid).setData(
        {
          'phoneNumber':firebaseUser.phoneNumber,
          'name':patientDetails[0],
          'age': patientDetails[1],
          'gender':patientDetails[2],
          'address':patientDetails[3],
        }).then((_){
      print('added patient details');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.primaryColor,
      child: SingleChildScrollView(
        child: Container(
          color: MyColors.primaryColor,
          margin: EdgeInsets.only(
              left: MyDimens.double_40, right: MyDimens.double_40, top: MyDimens.double_120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MyStrings.registerLabel,
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: MyColors.white, fontFamily: 'airbnb')),
                  MySpaces.vSmallGapInBetween,
                  _buildCupertinoTextField(0),
                  MySpaces.vSmallGapInBetween,
                  _buildCupertinoTextField(1),
                  MySpaces.vSmallGapInBetween,
                  _buildCupertinoTextField(2),
                  MySpaces.vSmallGapInBetween,
                  _buildCupertinoTextField(3),
                  MySpaces.vMediumGapInBetween,
                ],
              ),
              FlatButton(
                onPressed: () {
                  _onPressedAddDocDetails();
                  Navigator.pushNamed(context, HomePage.id);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MyDimens.double_4)),
                color: MyColors.lighterPink,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MyDimens.double_15,
                      horizontal: MyDimens.double_20),
                  child: Text(MyStrings.buttonLabel2,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: MyColors.primaryColor,
                          fontFamily: 'lexenddeca')),
                ),
              ),
              Padding(padding: EdgeInsets.all(MyDimens.double_200),),
            ],
          )
        ),
      ),
    );
  }

  Widget _buildCupertinoTextField(int index) {
    return CupertinoTextField(
      padding: EdgeInsets.symmetric(
          horizontal: MyDimens.double_20, vertical: MyDimens.double_15),
      decoration: BoxDecoration(
          color: MyColors.inputFieldPink,
          borderRadius: BorderRadius.all(Radius.circular(MyDimens.double_4))),
      style: Theme.of(context)
          .textTheme
          .subtitle1
          .copyWith(color: MyColors.lightestPink, fontFamily: 'lexenddeca'),
      maxLines: 1,
      cursorColor: MyColors.white,
      cursorWidth: 3,
      cursorRadius: Radius.circular(50),
      placeholder: textWidgetPlaceholders[index],
      placeholderStyle: Theme.of(context).textTheme.headline6.copyWith(
          fontSize: 18,
          color: MyColors.inputFieldTextPink,
          fontFamily: 'lexenddeca'),
      onChanged: (String value) {
        patientDetails[index] = value;
      },
    );
  }
}
