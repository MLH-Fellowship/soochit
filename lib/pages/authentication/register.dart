import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:soochit/global/myDimens.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/stores/login_store.dart';
import 'package:soochit/widgets/loaderHud.dart';
import 'package:soochit/widgets/snackbar.dart';

class Register extends StatefulWidget {
  static String id = "login_page";

  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                backgroundColor: MyColors.primaryColor,
                key: loginStore.loginScaffoldKey,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  left: MyDimens.double_30,
                                  right: MyDimens.double_30,
                                  top: MyDimens.double_25 * 2,
                                ),
                                child: Column(
                                  // ignore: prefer_const_literals_to_create_immutable
                                  children: <Widget>[
                                    // ignore: prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: MyDimens.double_30,
                                      vertical: MyDimens.double_30),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/medicine.png'),
                                    fit: BoxFit.cover,
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: MyDimens.double_30),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(MyStrings.phoneRequest,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                              color: MyColors.white,
                                              fontFamily: 'lexenddeca')),
                                ),
                              ),
                              Container(
                                height: 3 * MyDimens.double_20,
                                constraints: BoxConstraints(
                                    maxWidth: MyDimens.double_600),
                                margin: EdgeInsets.symmetric(
                                    horizontal: MyDimens.double_30,
                                    vertical: MyDimens.double_20),
                                child: CupertinoTextField(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MyDimens.double_15),
                                    decoration: BoxDecoration(
                                        color: MyColors.inputFieldPink,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                MyDimens.double_4))),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                            color: MyColors.lightestPink,
                                            fontFamily: 'lexenddeca'),
                                    controller: phoneController,
                                    clearButtonMode:
                                        OverlayVisibilityMode.editing,
                                    keyboardType: TextInputType.phone,
                                    maxLines: 1,
                                    placeholder: MyStrings.placeholderLoginAuth,
                                    placeholderStyle: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(fontSize: 18,
                                            color: MyColors.inputFieldTextPink,
                                            fontFamily: 'lexenddeca')),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: MyDimens.double_30,
                                    vertical: MyDimens.double_10),
                                constraints: BoxConstraints(
                                    maxWidth: MyDimens.double_600),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: OutlineButton(
                                        onPressed: () {
                                          if (phoneController.text.isNotEmpty) {
                                            loginStore.getCodeWithPhoneNumber(
                                                context,
                                                phoneController.text
                                                    .toString());
                                          } else {
                                            loginStore
                                                .loginScaffoldKey.currentState
                                                .showSnackBar(getSnackBar(
                                                    context,
                                                    MyStrings
                                                        .invalidPhoneNumber));
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MyDimens.double_4)),
                                        borderSide: BorderSide(
                                            color: MyColors.lighterPink,
                                            width: MyDimens.double_1),
                                        color: MyColors.primaryColor,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: MyDimens.double_15,
                                              bottom: MyDimens.double_15),
                                          child: Text(MyStrings.buttonLabel,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                      color:
                                                          MyColors.lighterPink,
                                                      fontFamily:
                                                          'lexenddeca')),
                                        ),
                                      ),
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}
