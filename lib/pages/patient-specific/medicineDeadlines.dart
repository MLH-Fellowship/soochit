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

  Future<String> getName() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('Patient')
        .document(firebaseUser.uid)
        .get()
        .then((value) {
      currentUsername = value.data['name'] + "'s Medical Deadlines";
      // print(currentUsername);
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
                  .document('J9L00wEPDkWtEf2YlDV7')
                  .snapshots(),
              builder: (context, snapshot) {
                final DocumentSnapshot ds = snapshot.data;
                final Map<String, dynamic> map = ds.data;

                var timeList = new List();
                map.forEach((key, value) {
                  for (var item in map[key]) {
                    timeList.add(item);
                  }
                });
                print(timeList);
                var rendermap = new Map();
                for (int i = 0; i < timeList.length; i++) {
                  rendermap[timeList.toList()[i]] = [];
                }
                rendermap.forEach((key, value) {
                  var medlist = new List();
                  map.forEach((key1, value1) {
                    for (var item in map[key1]) {
                      if (item == key) {
                        medlist.add(key1);
                        // print(key1);
                      }
                    }
                  });
                  rendermap[key] = medlist;
                });
                print(rendermap);

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
                      children: <Widget>[
                        for (var item in timeList)
                          Column(
                            children: <Widget>[
                              for (int i = 0; i < 1; i++)
                                MedicineDeadlineReminder(
                                  medName: rendermap[item][i],
                                  time: item,
                                ),
                            ],
                          )
                      ],
                    )
                  ],
                );
              }),
        ),
      )),
    );
  }
}
