import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soochit/pages/authentication//home_page.dart';
import 'package:soochit/pages/authentication/login_page.dart';
import 'package:soochit/stores/login_store.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<LoginStore>(context, listen: false).isAlreadyAuthenticated().then((result) {
      if (result) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>  HomePage()), (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>  LoginPage()), (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
