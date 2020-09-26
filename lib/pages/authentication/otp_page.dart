import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/mySpaces.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/stores/login_store.dart';
import 'package:soochit/widgets/loader_hud.dart';
import 'package:soochit/global/myColors.dart';

class OtpPage extends StatefulWidget {
  OtpPage({Key key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: MyDimens.double_40,
        width: MyDimens.double_40,
        decoration: BoxDecoration(
            color: MyColors.lightPink,
            border: Border.all(color: MyColors.lighterPink),
            borderRadius: BorderRadius.all(Radius.circular(MyDimens.double_4))),
        child: Center(
            child: Text(
          text[position],
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: MyColors.lightestPink, fontFamily: 'lexenddeca'),
        )),
      );
    } catch (e) {
      return Container(
        height: MyDimens.double_40,
        width: MyDimens.double_40,
        decoration: BoxDecoration(
            color: MyColors.lightPink,
            border: Border.all(color: MyColors.lighterPink),
            borderRadius: BorderRadius.all(Radius.circular(MyDimens.double_4))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Observer(
          builder: (_) => LoaderHUD(
            inAsyncCall: loginStore.isOtpLoading,
            child: Scaffold(
              backgroundColor: MyColors.primaryColor,
              key: loginStore.otpScaffoldKey,
              appBar: AppBar(
                leading: IconButton(
                  icon: Container(
                    padding: EdgeInsets.all(MyDimens.double_10),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(MyDimens.double_20)),
                      color: MyColors.lightestPink,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: MyColors.primaryColor,
                      size: MyDimens.double_20,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                elevation: 0,
                backgroundColor: MyColors.primaryColor,
                brightness: Brightness.light,
              ),
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: MyDimens.double_20,
                                      left: MyDimens.double_20,
                                      right: MyDimens.double_20,
                                      bottom: MyDimens.double_20,
                                    ),
                                    child: Column(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        // ignore: prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            MyStrings.welcomeToLabel,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                    color: MyColors.lighterPink,
                                                    fontFamily: 'airbnb',
                                                    fontSize: 30),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(MyStrings.appName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3
                                                  .copyWith(
                                                      color: MyColors.white,
                                                      fontFamily: 'airbnb')),
                                        ),
                                        MySpaces.vSmallGapInBetween,
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(MyStrings.otpRequest,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                  color: MyColors.white,
                                                  fontFamily: 'lexenddeca')),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    constraints: BoxConstraints(maxWidth: MyDimens.double_600),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        otpNumberWidget(0),
                                        otpNumberWidget(1),
                                        otpNumberWidget(2),
                                        otpNumberWidget(3),
                                        otpNumberWidget(4),
                                        otpNumberWidget(5),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: MyDimens.double_20, vertical: MyDimens.double_10),
                            constraints: BoxConstraints(maxWidth: 500),
                            child: Row(
                              children: [
                                Expanded(
                                  child: OutlineButton(
                                    onPressed: () {
                                      loginStore.validateOtpAndLogin(context, text);
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(MyDimens.double_4)),
                                    borderSide: BorderSide(
                                        color: MyColors.lighterPink,
                                        width: MyDimens.double_1),
                                    color: MyColors.primaryColor,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: MyDimens.double_15,
                                          bottom: MyDimens.double_15),
                                      child: Text(MyStrings.buttonLabel1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(
                                                  color: MyColors.lighterPink,
                                                  fontFamily: 'lexenddeca')),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          NumericKeyboard(
                            onKeyboardTap: _onKeyboardTap,
                            textColor: MyColors.lightestPink,
                            rightIcon: Icon(
                              Icons.backspace,
                              color: MyColors.lightestPink,
                            ),
                            rightButtonFn: () {
                              setState(() {
                                text = text.substring(0, text.length - 1);
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
