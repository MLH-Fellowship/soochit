import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myStrings.dart';
import 'package:soochit/pages/authentication/register.dart';
import 'package:soochit/pages/authentication/signout.dart';
import 'package:soochit/stores/login_store.dart';

class SplashScreen extends StatefulWidget {
  static String id="splash_page";
  SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<LoginStore>(context, listen: false).isAlreadyAuthenticated().then((result) {
      if (result) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>  HomePage()), (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>  Register()), (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          child: Text(
            MyStrings.appName, style: Theme.of(context).textTheme.headline3.copyWith(color: MyColors.primaryColor, fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
        )
    );
  }
}
