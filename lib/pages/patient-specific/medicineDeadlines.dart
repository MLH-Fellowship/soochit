import 'package:flutter/material.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/widgets/medicineDeadlineReminder.dart';

class MedicineDeadlines extends StatefulWidget {
  static String id = "homePatient";
  @override
  _MedicineDeadlinesState createState() => _MedicineDeadlinesState();
}

class _MedicineDeadlinesState extends State<MedicineDeadlines> {
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
                  MyStrings.patientMedDeadlines, style: Theme.of(context).textTheme.headline4.copyWith(color: MyColors.primaryColor, fontFamily: 'airbnb'),
                ),
                MySpaces.vLargeGapInBetween,
                Column(
                  children: [
                    MedicineDeadlineReminder(),
                    MySpaces.vMediumGapInBetween,
                    MedicineDeadlineReminder(),
                    MySpaces.vMediumGapInBetween,
                    MedicineDeadlineReminder(),
                    MySpaces.vMediumGapInBetween,
                    MedicineDeadlineReminder(),
                    MySpaces.vMediumGapInBetween,
                    MedicineDeadlineReminder(),
                    MySpaces.vMediumGapInBetween,
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
