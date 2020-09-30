import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/stores/login_store.dart';
import 'package:soochit/widgets/previousPatientCard.dart';

class PatientHistory extends StatefulWidget {
  static String id = "patientHistory";

  @override
  _PatientHistoryState createState() => _PatientHistoryState();
}

class _PatientHistoryState extends State<PatientHistory> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(builder: (_, loginStore, __) {
      return Scaffold(
        backgroundColor: MyColors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(MyDimens.double_30),
            child: Column(
              children: [
                MySpaces.vMediumGapInBetween,
                StreamBuilder(
                    stream: Firestore.instance.collection('Doctor').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                MyColors.primaryColor),
                          ),
                        );
                      } else {
                        String name;
                        String uid = loginStore.firebaseUser.uid;
                        for (int i = 0;
                            i < snapshot.data.documents.length;
                            i++) {
                          if (snapshot.data.documents[i].documentID == uid) {
                            name = snapshot.data.documents[i].data['name'];
                          }
                        }
                        return Text(
                          name + MyStrings.doctorPreviousPatients,
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: MyColors.primaryColor,
                              fontFamily: 'airbnb'),
                        );
                      }
                    }),
                MySpaces.vLargeGapInBetween,
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  margin: EdgeInsets.only(bottom: MyDimens.double_30),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: MyColors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(MyDimens.double_7)),
                    ),
                  ),
                  height: 50,
                ),
                StreamBuilder(
                    stream:
                        Firestore.instance.collection('Patient').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                MyColors.primaryColor),
                          ),
                        );
                      } else {
                        List patientDet = List.generate(
                            snapshot.data.documents.length, (i) => List(4),
                            growable: false); // uid, name, phoneNumber, age
                        for (int i = 0;
                            i < snapshot.data.documents.length;
                            i++) {
                          String uid = snapshot.data.documents[i].documentID;
                          String name = snapshot.data.documents[i].data['name'];
                          String phoneNumber =
                              snapshot.data.documents[i].data['phoneNumber'];
                          String age = snapshot.data.documents[i].data['age'];
                          patientDet[i][0] = uid;
                          patientDet[i][1] = name;
                          patientDet[i][2] = phoneNumber;
                          patientDet[i][3] = age;
                        }
                        return Column(
                          children: [
                            for (int i = 0; i < patientDet.length; i++)
                              previousPatientCard(context, patientDet[i]),
                          ],
                        );
                      }
                    }),
              ],
            ),
          ),
        )),
      );
    });
  }
}
