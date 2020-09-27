import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/stores/login_store.dart';
import 'package:soochit/widgets/loaderHud.dart';
import 'package:soochit/global/myColors.dart';

class EnterOTP extends StatefulWidget {
  static String id="otp_page";

  EnterOTP({Key key}) : super(key: key);

  @override
  _EnterOTPState createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
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

            color: MyColors.inputFieldPink,
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
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(MyDimens.double_20),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(MyStrings.otpRequest,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                .copyWith(
                                                color: MyColors.white,
                                                fontFamily: 'lexenddeca')),
                                      ),
                                    ),
                                    Container(
                                      constraints: BoxConstraints(maxWidth: MyDimens.double_600),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  padding: EdgeInsets.symmetric(vertical: MyDimens.double_100),
                              )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: MyDimens.double_20, vertical: MyDimens.double_10),
                            constraints: BoxConstraints(maxWidth: MyDimens.double_600),
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
