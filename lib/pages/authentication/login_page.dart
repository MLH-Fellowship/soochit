import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:soochit/stores/login_store.dart';
import 'package:soochit/widgets/loader_hud.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Observer(
          builder: (_) => LoaderHUD(
            inAsyncCall: loginStore.isLoginLoading,
            child: Material(
              child: Scaffold(
                backgroundColor: const Color(0xFFF8F8F8),
                key: loginStore.loginScaffoldKey,
                body: SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                top: 40,
                              ),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  // ignore: prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      'Welcome!',
                                      style: TextStyle(
                                        fontSize: 29,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF08134D),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      'Enter your phone number',
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
                              height: 60,
                              constraints: const BoxConstraints(maxWidth: 500),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: CupertinoTextField(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 16),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                                controller: phoneController,
                                clearButtonMode: OverlayVisibilityMode.editing,
                                keyboardType: TextInputType.phone,
                                maxLines: 1,
                                placeholder: '+91         Phone number',
                                placeholderStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF8F8F8F),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              constraints: const BoxConstraints(maxWidth: 500),
                              child: RaisedButton(
                                onPressed: () {
                                  if (phoneController.text.isNotEmpty) {
                                    loginStore.getCodeWithPhoneNumber(context,
                                        phoneController.text.toString());
                                  } else {
                                    loginStore.loginScaffoldKey.currentState
                                        .showSnackBar(const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        'Please enter a valid phone number',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ));
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                highlightElevation: 20,
                                color: Colors.blue[700],
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 60, right: 60, top: 20, bottom: 20),
                                  child: Text(
                                    'Send Security Code',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
