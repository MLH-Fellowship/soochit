import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/pages/login.dart';

class Welcome extends StatefulWidget {
  static String id = "welcome";
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: MyColors.primaryColor,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: MyDimens.double_100),
                child: Column(
                  children: [
                    Text(
                      MyStrings.welcomeToLabel,
                      style: Theme.of(context).textTheme.headline4.copyWith(color: MyColors.lighterPink, fontFamily: 'airbnb', fontSize: 30),
                    ),
                    Text(
                      MyStrings.appName,
                      style: Theme.of(context).textTheme.headline3.copyWith(color: MyColors.white,fontFamily: 'airbnb')
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MyDimens.double_negative_300,
            right: MyDimens.double_negative_200,
            child: Container(
              height: MyDimens.double_600,
              width: MyDimens.double_600,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: MyDimens.double_100,
            left: MyDimens.double_10,
            right: MyDimens.double_10,
            child: Container(
              height: MyDimens.double_300,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal:MyDimens.double_20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MyDimens.double_10)
                ),
                elevation: MyDimens.double_7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: MyDimens.double_30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: MyDimens.double_20),
                        child: Align(
                          child: Text(
                              MyStrings.whoAreYouLabel,
                              style: Theme.of(context).textTheme.headline4.copyWith(color: MyColors.primaryColor, fontFamily: 'lexenddeca')
                          ),
                            alignment: Alignment.centerLeft,
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: MyDimens.double_2point5),
                        child: Row(
                          children: [
                            Expanded(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(vertical: MyDimens.double_10, horizontal: MyDimens.double_20),
                                onPressed: () {},
                                color: MyColors.lightestPink,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(MyDimens.double_7)),
                                child: Align(
                                  child: Text(
                                      MyStrings.doctorLabel,
                                      style: Theme.of(context).textTheme.headline6.copyWith(color: MyColors.black, fontFamily: 'lexenddeca')
                                  ),
                                  alignment: Alignment.centerLeft,
                                )
                            ),
                            ),],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: MyDimens.double_2point5),
                        child:
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: FlatButton(
                                      padding: EdgeInsets.symmetric(vertical: MyDimens.double_10, horizontal: MyDimens.double_20),
                                    onPressed: () {},
                                    color: MyColors.lightestPink,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(MyDimens.double_7)),
                                    child: Align(
                                      child: Text(
                                          MyStrings.patientLabel,
                                          style: Theme.of(context).textTheme.headline6.copyWith(color: MyColors.black, fontFamily: 'lexenddeca')
                                      ),
                                      alignment: Alignment.centerLeft,
                                    )
                                  ),
                                ),
                              ],
                            ),MySpaces.vSmallGapInBetween,
                            InkWell(
                              child: Align(
                                child: Icon(
                                  CupertinoIcons.check_mark_circled_solid, size: MyDimens.double_40,color: MyColors.primaryColor,
                                ),
                                alignment: Alignment.centerRight,
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, Login.id);
                              },
                            )
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
