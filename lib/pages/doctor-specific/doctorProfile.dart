import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soochit/stores/login_store.dart';

class DoctorProfile extends StatefulWidget {
  static String id = "doctorProfile";

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(builder: (_, loginStore, __) {
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
                      StreamBuilder(
                          stream: Firestore.instance
                              .collection('Doctor')
                              .snapshots(),
                          builder: (context, snapshot) {
                            String doctorName,
                                doctorPhoneNumber,
                                hospitalName,
                                hospitalAddress;
                            String docUid = loginStore.firebaseUser.uid;
                            for(int i=0;i<snapshot.data.documents.length;i++){
                                if(snapshot.data.documents[i].documentID==docUid){
                                  doctorName=snapshot.data.documents[i].data['name'];
                                  doctorPhoneNumber=snapshot.data.documents[i].data['phoneNumber'];
                                  hospitalName=snapshot.data.documents[i].data['hospitalName'];
                                  hospitalAddress=snapshot.data.documents[i].data['hospitalAddress'];
                                  break;
                                }
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MySpaces.vMediumGapInBetween,
                                Text(
                                  doctorName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                          color: MyColors.primaryColor,
                                          fontFamily: 'airbnb'),
                                ),
                                MySpaces.vSmallGapInBetween,
                                Text(
                                  MyStrings.phoneNumberLabel + ":",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: MyColors.grey,
                                          fontFamily: 'lexenddeca'),
                                ),
                                Text(
                                  doctorPhoneNumber,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          color: MyColors.black,
                                          fontFamily: 'lexenddeca'),
                                ),
                                MySpaces.vSmallGapInBetween,
                                Text(
                                  MyStrings.hospitalNameLabel + ":",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: MyColors.grey,
                                          fontFamily: 'lexenddeca'),
                                ),
                                Text(
                                  hospitalName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          color: MyColors.black,
                                          fontFamily: 'lexenddeca'),
                                ),
                                MySpaces.vSmallGapInBetween,
                                Text(
                                  MyStrings.hospitalAddressLabel + ":",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: MyColors.grey,
                                          fontFamily: 'lexenddeca'),
                                ),
                                Text(
                                  hospitalAddress,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          color: MyColors.black,
                                          fontFamily: 'lexenddeca'),
                                ),
                                MySpaces.vSmallGapInBetween,
                                Text(
                                  MyStrings.signatureLabel + ":",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: MyColors.grey,
                                          fontFamily: 'lexenddeca'),
                                ),
                                Text(
                                  'TODO',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          color: MyColors.black,
                                          fontFamily: 'lexenddeca'),
                                ),
                                MySpaces.vSmallGapInBetween,
                              ],
                            );
                          }),
                    ],
                  )),
            ),
          ],
        )),
      );
    });
  }
}
