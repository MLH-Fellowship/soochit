import 'package:flutter/material.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/widgets/previousPatientCard.dart';

class HomeDoctor extends StatefulWidget {
  static String id = "homeDoctor";
  @override
  _HomeDoctorState createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
    body: SafeArea(
          child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(MyDimens.double_30),
            child: Column(
              children: [
                MySpaces.vMediumGapInBetween,
                Text(
                  MyStrings.doctorPreviousPatients, style: Theme.of(context).textTheme.headline4.copyWith(color: MyColors.primaryColor, fontFamily: 'airbnb'),
                ),
                MySpaces.vLargeGapInBetween,
                Container(
                  width: MediaQuery.of(context).size.width*0.80,
                  margin: EdgeInsets.only(bottom: MyDimens.double_30),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: MyColors.black,),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(MyDimens.double_7)),
                    ),
                  ),
                    height: 50,
                ),
                Column(
                  children: [
                    PreviousPatientCard(),
                    MySpaces.vSmallGapInBetween,
                    PreviousPatientCard(),
                    MySpaces.vSmallGapInBetween,
                    PreviousPatientCard(),
                    MySpaces.vSmallGapInBetween,
                    PreviousPatientCard(),
                    MySpaces.vSmallGapInBetween,
                    PreviousPatientCard(),
                    MySpaces.vSmallGapInBetween,
                    PreviousPatientCard(),
                    MySpaces.vSmallGapInBetween,
                    PreviousPatientCard(),
                    MySpaces.vSmallGapInBetween,
                    PreviousPatientCard(),
                    MySpaces.vSmallGapInBetween,
                    PreviousPatientCard(),
                    MySpaces.vSmallGapInBetween,
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
