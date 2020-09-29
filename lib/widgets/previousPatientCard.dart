import 'package:flutter/material.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/pages/doctor-specific/samplePatientProfile.dart';

class PreviousPatientCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, SamplePatientProfile.id);
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: MyDimens.double_30),
          height: MyDimens.double_70,
          width: MediaQuery.of(context).size.width*0.90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MyDimens.double_7),
            color: MyColors.lightestPink,
          ),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://github.com/dotrachit.png"),
                      )
                  )),
              MySpaces.hSmallGapInBetween,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    MyStrings.date,style: Theme.of(context).textTheme.headline5.copyWith(color: MyColors.black, fontFamily: 'lexenddeca'),
                  ),
                  MySpaces.vSmallestGapInBetween,
                  Text(
                    MyStrings.phoneNumber + ' • ' + MyStrings.recentAppointmentDate,style: Theme.of(context).textTheme.bodyText2.copyWith(color: MyColors.grey, fontFamily: 'lexenddeca'),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}
