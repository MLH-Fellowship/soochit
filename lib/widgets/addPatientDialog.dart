import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';

class AddPatientDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MyDimens.double_10),
      ),
      elevation: 0.0,
      backgroundColor: MyColors.primaryColor,
      child: Container(
        margin: EdgeInsets.all(20),
        color: MyColors.primaryColor,
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.addAPatientLabel, style: Theme.of(context).textTheme.headline5.copyWith(color: MyColors.white, fontFamily: 'lexenddeca'),
                ),
                MySpaces.vSmallGapInBetween,
                CupertinoTextField(
                  keyboardType: TextInputType.phone,
                  padding: EdgeInsets.symmetric(
                      horizontal: MyDimens.double_20, vertical: MyDimens.double_15),
                  decoration: BoxDecoration(
                      color: MyColors.inputFieldPink,
                      borderRadius: BorderRadius.all(Radius.circular(MyDimens.double_4))),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: MyColors.lightestPink, fontFamily: 'lexenddeca'),
                  maxLines: 1,
                  cursorColor: MyColors.white,
                  cursorWidth: 3,
                  cursorRadius: Radius.circular(50),
                  placeholder: MyStrings.phoneNumberLabel,
                  placeholderStyle: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 18,
                      color: MyColors.inputFieldTextPink,
                      fontFamily: 'lexenddeca'),
                ),
                MySpaces.vGapInBetween,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Text(MyStrings.cancelLabel, style: Theme.of(context).textTheme.bodyText2.copyWith(color: MyColors.lightPink, fontSize: MyDimens.double_15, fontFamily: 'lexenddeca'),),
                    ),
                    MySpaces.hSmallGapInBetween,
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MyDimens.double_4),
                      ),
                      onPressed: (){
                        // TODO: add the user in doctor's database.
                        Navigator.of(context).pop();
                      },
                      color: MyColors.white,
                      child: Text(
                        MyStrings.confirmLabel, style: Theme.of(context).textTheme.bodyText1.copyWith(color: MyColors.primaryColor, fontSize: MyDimens.double_15, fontFamily: 'lexendeca'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}


