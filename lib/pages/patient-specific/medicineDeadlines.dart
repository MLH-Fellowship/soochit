import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/widgets/medicineDeadlineReminder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineDeadlines extends StatefulWidget {
  static String id = "medicineDeadlines";
  FirebaseUser user;
  MedicineDeadlines({Key key, @required this.user}) : super(key: key);
  @override
  _MedicineDeadlinesState createState() => _MedicineDeadlinesState(user: user);
}

class _MedicineDeadlinesState extends State<MedicineDeadlines> {
  FirebaseUser user;
  String currentUsername;
  String userUID;

  Future<String> getName() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    userUID = firebaseUser.uid;
    Firestore.instance
        .collection('Patient')
        .document(userUID)
        .get()
        .then((value) {
      currentUsername = value.data['name'] + "'s Medical Deadlines";
      print(currentUsername);
      return currentUsername;
    });
  }

  _MedicineDeadlinesState({Key key, @required this.user});
  @override
  Widget build(BuildContext context) {
    getName();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: MyDimens.double_10, horizontal: MyDimens.double_30),
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection('Medicine')
                  .document(userUID)
                  .snapshots(),
              builder: (context, snapshot) {
                final DocumentSnapshot ds = snapshot.data;
                final Map<String, dynamic> map = ds.data;
                return Column(
                  children: [
                    MySpaces.vMediumGapInBetween,
                    Text(
                      currentUsername,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: MyColors.primaryColor, fontFamily: 'airbnb'),
                    ),
                    MySpaces.vLargeGapInBetween,
                    Column(
                      children: map.entries.map((MapEntry entry) => MedicineDeadlineReminder(medName: entry.value,time: entry.key)).toList(),
                    )
                  ],
                );
              }),
        ),
      )),
    );
  }
}
