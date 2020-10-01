import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddMedicineDialog extends StatefulWidget {
  @override
  _AddMedicineDialogState createState() => _AddMedicineDialogState();
}

class _AddMedicineDialogState extends State<AddMedicineDialog> {

  TextEditingController medicineNameController = new TextEditingController();
  TextEditingController timeController = new TextEditingController();
  String time;
  String medicineName;
  List medicineList = [];

  void _onPressedAddMedicineDetails() async{
    var firebaseUser = await FirebaseAuth.instance.currentUser(); // finds the current user
    // this takes up a firebase instance and makes a collection and a document (if not present already).
    // Further it overwrites all data inside that collection and document by the string map we have pu
    medicineList.add(medicineNameController.text);

    Firestore.instance.collection('Medicine').document(firebaseUser.uid).updateData(
        {
          timeController.text:FieldValue.arrayUnion(medicineList),
          // the string map to add to FireStore
        }).then((_){
      print('added medicine details'); // print some message to console to see everything went good!
    });
  }

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
                      MyStrings.addAMedicineLabel, style: Theme.of(context).textTheme.headline5.copyWith(color: MyColors.white, fontFamily: 'lexenddeca'),
                    ),
                    MySpaces.vSmallGapInBetween,
                    _CupertinoTextFieldPres(placeholderTextIndex: 0, textInputType: TextInputType.text, controller: medicineNameController,),
                    MySpaces.vGapInBetween,
                    _CupertinoTextFieldPres(placeholderTextIndex: 1, textInputType: TextInputType.text, controller: timeController,),
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
                            // adds the medicine in database.
                            _onPressedAddMedicineDetails();
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

class _CupertinoTextFieldPres extends StatelessWidget {
  int placeholderTextIndex;
  TextInputType textInputType;
  TextEditingController controller;

  _CupertinoTextFieldPres({@required this.placeholderTextIndex, @required this.textInputType, this.controller});
  List<String> placeholderTextList = [
    MyStrings.medicineNameLabel,
    MyStrings.timingsLabel,
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      keyboardType: textInputType,
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
      placeholder: placeholderTextList[placeholderTextIndex],
      placeholderStyle: Theme.of(context).textTheme.headline6.copyWith(
          fontSize: 18,
          color: MyColors.inputFieldTextPink,
          fontFamily: 'lexenddeca'),
    );
  }
}


