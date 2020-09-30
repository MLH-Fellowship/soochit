import 'package:flutter/material.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/pages/doctor-specific/samplePatientProfile.dart';

Widget previousPatientCard(BuildContext context, List patientDet) {
  // print(patientDet);
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => SamplePatientProfile(patientDet: patientDet)));
    },
    child: Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: MyDimens.double_30),
            height: MyDimens.double_70,
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MyDimens.double_7),
              color: MyColors.lightestPink,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              new NetworkImage("https://github.com/dotrachit.png"),
                        ))),
                MySpaces.hSmallGapInBetween,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientDet[1],
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: MyColors.black, fontFamily: 'lexenddeca'),
                    ),
                    MySpaces.vSmallestGapInBetween,
                    Text(
                      patientDet[2] +
                          ' • ' +
                          MyStrings.recentAppointmentDate,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: MyColors.grey, fontFamily: 'lexenddeca'),
                    ),
                  ],
                )
              ],
            ),
        ),
        MySpaces.vSmallGapInBetween,
      ],
    ),
  );
}
