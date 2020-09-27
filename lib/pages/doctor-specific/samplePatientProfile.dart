import 'package:flutter/material.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/widgets/prescriptionHistoryCard.dart';

class SamplePatientProfile extends StatefulWidget {
  static String id = "samplePatientProfile";
  @override
  _SamplePatientProfileState createState() => _SamplePatientProfileState();
}

class _SamplePatientProfileState extends State<SamplePatientProfile> {
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MySpaces.vMediumGapInBetween,
                      Text(
                        MyStrings.patientName, style: Theme.of(context).textTheme.headline4.copyWith(color: MyColors.primaryColor, fontFamily: 'airbnb'),
                      ),
                      MySpaces.vSmallGapInBetween,
                      Text(
                        MyStrings.ageLabel + ":", style: Theme.of(context).textTheme.bodyText1.copyWith(color: MyColors.grey, fontFamily: 'lexenddeca'),
                      ),
                      Text(
                        MyStrings.sampleAge + " " + MyStrings.yearsOldLabel, style: Theme.of(context).textTheme.headline5.copyWith(color: MyColors.black, fontFamily: 'lexenddeca'),
                      ),
                      MySpaces.vSmallGapInBetween,
                      Text(
                        MyStrings.phoneNumberLabel + ":", style: Theme.of(context).textTheme.bodyText1.copyWith(color: MyColors.grey, fontFamily: 'lexenddeca'),
                      ),
                      Text(
                        MyStrings.phoneNumber, style: Theme.of(context).textTheme.headline5.copyWith(color: MyColors.black, fontFamily: 'lexenddeca'),
                      ),
                      MySpaces.vSmallGapInBetween,
                      Container(
                        width: double.infinity,
                        height: MyDimens.double_1,
                        color: MyColors.grey,
                      ),
                      MySpaces.vSmallGapInBetween,
                    ],
                  ),
                  Column(
                    children: [
                      PrescriptionHistoryCard(),
                      MySpaces.vSmallGapInBetween,
                      PrescriptionHistoryCard(),
                      MySpaces.vSmallGapInBetween,
                      PrescriptionHistoryCard(),
                      MySpaces.vSmallGapInBetween,
                      PrescriptionHistoryCard(),
                      MySpaces.vSmallGapInBetween,
                      PrescriptionHistoryCard(),
                      MySpaces.vSmallGapInBetween,
                      PrescriptionHistoryCard(),
                      MySpaces.vSmallGapInBetween,
                      PrescriptionHistoryCard(),
                    ],
                  ),
                ],
              )
            ),
          )
      ),
    );
  }
}
