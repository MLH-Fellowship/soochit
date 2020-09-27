import 'package:flutter/material.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/mySpaces.dart';

class MedicineDeadlineReminder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MyDimens.double_35,
          width: MediaQuery.of(context).size.width*0.80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(MyDimens.double_10),topRight: Radius.circular(MyDimens.double_10)),
            color: MyColors.primaryColor,
          ),
          child: Align(
            child: Text(
              MyStrings.time, style: Theme.of(context).textTheme.subtitle1.copyWith(color: MyColors.white, fontFamily: 'lexenddeca'),
            ),
              alignment: Alignment.center,
          )
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: MyDimens.double_30),
            height: MyDimens.double_200-MyDimens.double_35,
            width: MediaQuery.of(context).size.width*0.80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MyDimens.double_10),bottomRight: Radius.circular(MyDimens.double_10)),
              color: MyColors.lightestPink,
            ),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyStrings.paracetamolLabel,style: Theme.of(context).textTheme.headline6.copyWith(color: MyColors.black, fontFamily: 'lexenddeca'),
                ),
                MySpaces.vSmallestGapInBetween,
                Text(
                  MyStrings.crocinLabel,style: Theme.of(context).textTheme.headline6.copyWith(color: MyColors.black, fontFamily: 'lexenddeca'),
                ),
                MySpaces.vSmallestGapInBetween,
                Text(
                  MyStrings.paracetamolLabel,style: Theme.of(context).textTheme.headline6.copyWith(color: MyColors.black, fontFamily: 'lexenddeca'),
                ),
                MySpaces.vSmallestGapInBetween,
                Text(
                  MyStrings.crocinLabel,style: Theme.of(context).textTheme.headline6.copyWith(color: MyColors.black, fontFamily: 'lexenddeca'),
                ),
              ],
            )
        ),
      ],
    );
  }
}
