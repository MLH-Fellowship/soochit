import 'package:flutter/material.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/pages/pdf/reportPDF.dart';

class PrescriptionHistoryCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: MyDimens.double_30),
          height: MyDimens.double_70,
          width: MediaQuery.of(context).size.width*0.80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MyDimens.double_7),
            color: MyColors.lightestPink,
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyStrings.date,style: Theme.of(context).textTheme.headline5.copyWith(color: MyColors.black, fontFamily: 'lexenddeca'),
              ),
              MySpaces.vSmallestGapInBetween,
              Text(
                MyStrings.sampleProblem,style: Theme.of(context).textTheme.bodyText2.copyWith(color: MyColors.grey, fontFamily: 'lexenddeca'),
              ),
            ],
          )
      ),
      onTap: (){reportView(context);},
    );
  }
}
