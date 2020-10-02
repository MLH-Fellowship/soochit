import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/stores/login_store.dart';
import 'package:soochit/widgets/medicineDeadlineReminder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soochit/functions/notificationPlugin.dart';
import 'package:soochit/functions/notificationScreen.dart';

class MedicineDeadlines extends StatefulWidget {
  static String id = "medicineDeadlines";
  FirebaseUser user;

  MedicineDeadlines({Key key, @required this.user}) : super(key: key);

  @override
  _MedicineDeadlinesState createState() => _MedicineDeadlinesState(user: user);
}

class _MedicineDeadlinesState extends State<MedicineDeadlines> {
  FirebaseUser user;
  int count = 0;
  _MedicineDeadlinesState({Key key, @required this.user});


  @override
  void initState() {
    super.initState();
    notificationPlugin
        .setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(builder: (_, loginStore, __) {
      String uid = loginStore.firebaseUser.uid;
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: MyDimens.double_10, horizontal: MyDimens.double_30),
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection('Medicine')
                    .document(uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  final DocumentSnapshot ds = snapshot.data;
                  final Map<String, dynamic> map = ds.data;
                  return Column(
                    children: [
                      MySpaces.vMediumGapInBetween,
                      StreamBuilder(
                          stream: Firestore.instance
                              .collection('Patient')
                              .document(uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            String currentUsername = snapshot.data['name'];
                            return GestureDetector(
                              onTap: () async{
                                await notificationPlugin.scheduleNotification();
                              },
                              child: Text(
                                currentUsername + "'s Medical Deadlines",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: MyColors.primaryColor,
                                        fontFamily: 'airbnb'),
                              ),
                            );
                          }),
                      MySpaces.vLargeGapInBetween,
                      Column(
                        children: map.entries
                            .map((MapEntry entry) => MedicineDeadlineReminder(
                                medName: entry.value, time: entry.key))
                            .toList(),
                      )
                    ],
                  );
                }),
          ),
        )),
      );
    });
  }

  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
    print('Notification Received ${receivedNotification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
    Navigator.push(context, MaterialPageRoute(builder: (coontext) {
      return NotificationScreen(
        payload: payload,
      );
    }));
  }
}
