import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/mySpaces.dart';

class MedicineDeadlineReminder extends StatelessWidget {
  String time;
  String medName;
  MedicineDeadlineReminder({@required this.medName, @required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MyDimens.double_35,
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MyDimens.double_10),
                  topRight: Radius.circular(MyDimens.double_10)),
              color: MyColors.primaryColor,
            ),
            child: Align(
              child: Text(
                time,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: MyColors.white, fontFamily: 'lexenddeca'),
              ),
              alignment: Alignment.center,
            )),
        Container(
            padding: EdgeInsets.symmetric(horizontal: MyDimens.double_30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(MyDimens.double_10),
                  bottomRight: Radius.circular(MyDimens.double_10)),
              color: MyColors.lightestPink,
            ),
            child: Wrap(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medName,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: MyColors.black, fontFamily: 'lexenddeca'),
                    ),
                    MySpaces.vSmallestGapInBetween,
                  ],
                ),
              ],
            )),
        MySpaces.vMediumGapInBetween,
      ],
    );
  }
}
