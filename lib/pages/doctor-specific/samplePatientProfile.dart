import 'package:flutter/material.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/pages/doctor-specific/prescription.dart';
import 'package:soochit/widgets/prescriptionHistoryCard.dart';

class SamplePatientProfile extends StatefulWidget {
  static String id = "samplePatientProfile";

  List patientDet;
  SamplePatientProfile({Key key, @required this.patientDet}) : super(key: key);

  @override
  _SamplePatientProfileState createState() =>
      _SamplePatientProfileState(patientDet: patientDet);
}

class _SamplePatientProfileState extends State<SamplePatientProfile> {
  List patientDet;

  _SamplePatientProfileState({Key key, @required this.patientDet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(MyDimens.double_30),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MySpaces.vMediumGapInBetween,
                        Text(
                          patientDet[1],
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: MyColors.primaryColor,
                              fontFamily: 'airbnb'),
                        ),
                        MySpaces.vSmallGapInBetween,
                        Text(
                          MyStrings.ageLabel + ":",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: MyColors.grey, fontFamily: 'lexenddeca'),
                        ),
                        Text(
                          patientDet[3] + " " + MyStrings.yearsOldLabel,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: MyColors.black, fontFamily: 'lexenddeca'),
                        ),
                        MySpaces.vSmallGapInBetween,
                        Text(
                          MyStrings.phoneNumberLabel + ":",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: MyColors.grey, fontFamily: 'lexenddeca'),
                        ),
                        Text(
                          patientDet[2],
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: MyColors.black, fontFamily: 'lexenddeca'),
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
                )),
          ),
          Positioned(
            bottom: MyDimens.double_30,
            right: MyDimens.double_30,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Prescription(patientDet: patientDet)));
              },
              backgroundColor: MyColors.primaryColor,
              child: Icon(Icons.add, size: 40),
            ),
          )
        ],
      )),
    );
  }
}
