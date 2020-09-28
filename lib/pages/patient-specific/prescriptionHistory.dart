import 'package:flutter/material.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/widgets/prescriptionHistoryCard.dart';

class PrescriptionHistory extends StatefulWidget {
  static String id = "prescriptionHistory";
  @override
  _PrescriptionHistoryState createState() => _PrescriptionHistoryState();
}

class _PrescriptionHistoryState extends State<PrescriptionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: MyDimens.double_10, horizontal: MyDimens.double_30),
            child: Column(
              children: [
                MySpaces.vMediumGapInBetween,
                Text(
                  MyStrings.patientPrescriptionHistoryLabel, style: Theme.of(context).textTheme.headline4.copyWith(color: MyColors.primaryColor, fontFamily: 'airbnb'),
                ),
                MySpaces.vLargeGapInBetween,
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
                    MySpaces.vSmallGapInBetween,
                    PrescriptionHistoryCard()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

