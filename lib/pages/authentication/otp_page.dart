import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:soochit/stores/login_store.dart';
import 'package:soochit/theme.dart';
import 'package:soochit/widgets/loader_hud.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key key}) : super(key: key);

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
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(7))),
        child: Center(
            child: Text(
              text[position],
              style: const TextStyle(
                  color: Color(0xFF4B4B4B),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )),
      );
    } catch (e) {
      return Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(7))),
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
              backgroundColor: Colors.grey[200],
              key: loginStore.otpScaffoldKey,
              appBar: AppBar(
                leading: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: MyColors.primaryColorLight.withAlpha(20),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: MyColors.primaryColor,
                      size: 16,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                elevation: 0,
                backgroundColor: Colors.grey[200],
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 30,
                                    right: 30,
                                  ),
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: <Widget>[
                                      // ignore: prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Welcome!',
                                          style: TextStyle(
                                            fontSize: 29,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF08134D),
                                          ),
                                        ),
                                      ),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Enter your OTP number',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF8F8F8F),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  constraints:
                                  const BoxConstraints(maxWidth: 500),
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
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: RaisedButton(
                              onPressed: () {
                                loginStore.validateOtpAndLogin(context, text);
                              },
                              color: MyColors.primaryColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 60, right: 60, top: 10, bottom: 10),
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          NumericKeyboard(
                            onKeyboardTap: _onKeyboardTap,
                            textColor: MyColors.primaryColorLight,
                            rightIcon: Icon(
                              Icons.backspace,
                              color: MyColors.primaryColorLight,
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
