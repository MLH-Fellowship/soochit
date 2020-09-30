import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/pages/doctor-specific/homeDoctor.dart';
import 'package:soochit/stores/login_store.dart';
import 'package:soochit/widgets/addMedicineDialog.dart';

// Doctor's details -> now in array
// String name;
// String hospitalName;
// String hospitalAddress;
// String qualifications;
List<String> prescriptionDetails = ['', '',];
List<String> textWidgetPlaceholdersPres = [
  MyStrings.problemLabel,
  MyStrings.descriptionOptionalLabel,
];

class Prescription extends StatefulWidget {
  @override
  static String id = 'prescription';
  FirebaseUser user;

  List patientDet;

  Prescription({Key key, @required this.patientDet}) : super(key: key);

  @override
  _PrescriptionState createState() =>
      _PrescriptionState(patientDet: patientDet);
}

class _PrescriptionState extends State<Prescription> {
  List patientDet;

  _PrescriptionState({Key key, @required this.patientDet});

  void _onPressedAddPrescriptionDetails() async{
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection('Prescription').add(
        {
          // the string map to add to FireStore
          'problem' : prescriptionDetails[0],
          'problemDesc' : prescriptionDetails[1],
          'doctorUID' : firebaseUser.uid,
          'patientUID' : patientDet[0],
          'medicines' : 'Sample Medicine',
        }).then((_){
      print('added prescription details'); // print some message to console to see everything went good!
    });
  }

  @override
  Widget build(BuildContext context) {
    print(patientDet);
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Material(
          color: MyColors.primaryColor,
          child: SingleChildScrollView(
            child: Container(
                color: MyColors.primaryColor,
                margin: EdgeInsets.only(
                    left: MyDimens.double_40,
                    right: MyDimens.double_40,
                    top: MyDimens.double_120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MyStrings.prescriptionLabel,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(
                                    color: MyColors.white,
                                    fontFamily: 'airbnb')),
                        MySpaces.vSmallGapInBetween,
                        _buildCupertinoTextField(0),
                        MySpaces.vSmallGapInBetween,
                        _buildCupertinoTextField(1),
                        MySpaces.vSmallGapInBetween,
                      ],
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.add,
                        color: MyColors.white,
                      ),
                      onTap: showAddMedicineDialog,
                    ),
                    MySpaces.vSmallGapInBetween,
                    AddedMedicineCard(),
                    MySpaces.vGapInBetween,
                    AddedMedicineCard(),
                    MySpaces.vGapInBetween,
                    AddedMedicineCard(),
                    MySpaces.vSmallGapInBetween,
                    FlatButton(
                      onPressed: () {
                        _onPressedAddPrescriptionDetails();
                        Navigator.pushNamed(context, HomeDoctor.id);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(MyDimens.double_4)),
                      color: MyColors.lighterPink,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MyDimens.double_15,
                            horizontal: MyDimens.double_20),
                        child: Text(MyStrings.buttonLabel2,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    color: MyColors.primaryColor,
                                    fontFamily: 'lexenddeca')),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(MyDimens.double_200),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  Widget _buildCupertinoTextField(int index) {
    return CupertinoTextField(
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
      placeholder: textWidgetPlaceholdersPres[index],
      placeholderStyle: Theme.of(context).textTheme.headline6.copyWith(
          fontSize: 18,
          color: MyColors.inputFieldTextPink,
          fontFamily: 'lexenddeca'),
      onChanged: (String value) {
        prescriptionDetails[index] = value;
      },
    );
  }

  Future<Dialog> showAddMedicineDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AddMedicineDialog());
  }
}

class AddedMedicineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: MyDimens.double_20, vertical: MyDimens.double_15),
        width: MediaQuery.of(context).size.width * 0.80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyDimens.double_4),
          color: MyColors.inputFieldPink,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              MyStrings.sampleMedName,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: MyColors.white, fontFamily: 'lexenddeca'),
            ),
            MySpaces.vSmallestGapInBetween,
            Text(
              MyStrings.sampleMedTime,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: MyColors.inputFieldTextPink, fontFamily: 'lexenddeca'),
            ),
          ],
        ));
  }
}
