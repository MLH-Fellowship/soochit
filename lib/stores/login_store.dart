import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/pages/authentication/signout.dart';
import 'package:soochit/pages/authentication/register.dart';
import 'package:soochit/pages/authentication/enterOTP.dart';
import 'package:soochit/widgets/snackbar.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String actualCode;

  @observable
  bool isLoginLoading = false;
  @observable
  bool isOtpLoading = false;

  @observable
  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();
  @observable
  GlobalKey<ScaffoldState> otpScaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  FirebaseUser firebaseUser;

  @action
  Future<bool> isAlreadyAuthenticated() async {
    firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @action
  Future<void> getCodeWithPhoneNumber(
      BuildContext context, String phoneNumber) async {
    isLoginLoading = true;

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential auth) async {
          await _auth.signInWithCredential(auth).then((AuthResult value) {
            if (value != null && value.user != null) {
              print('Authentication successful');
              onAuthenticationSuccessful(context, value);
            } else {
              loginScaffoldKey.currentState.showSnackBar(
                  getSnackBar(context, MyStrings.invalidCodeOrAuth));
            }
          }).catchError((error) {
            loginScaffoldKey.currentState.showSnackBar(
                getSnackBar(context, MyStrings.somethingGoneWrong));
          });
        },
        verificationFailed: (AuthException authException) {
          print('Error message: ' + authException.message);
          loginScaffoldKey.currentState.showSnackBar(
              getSnackBar(context, MyStrings.invalidPhoneNumberFormat));
          isLoginLoading = false;
        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          actualCode = verificationId;
          isLoginLoading = false;
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => EnterOTP()));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          actualCode = verificationId;
        });
  }

  @action
  Future<void> validateOtpAndLogin(BuildContext context, String smsCode) async {
    isOtpLoading = true;
    final AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: actualCode, smsCode: smsCode);

    await _auth.signInWithCredential(_authCredential).catchError((error) {
      isOtpLoading = false;
      otpScaffoldKey.currentState
          .showSnackBar(getSnackBar(context, MyStrings.incorrectOTP));
    }).then((AuthResult authResult) {
      if (authResult != null && authResult.user != null) {
        print('Authentication successful');
        onAuthenticationSuccessful(context, authResult);
      }
    });
  }

  Future<void> onAuthenticationSuccessful(
      BuildContext context, AuthResult result) async {
    isLoginLoading = true;
    isOtpLoading = true;

    firebaseUser = result.user;

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomePage()),
        (Route<dynamic> route) => false);

    isLoginLoading = false;
    isOtpLoading = false;
  }

  @action
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => Register()),
        (Route<dynamic> route) => false);
    firebaseUser = null;
  }
}
