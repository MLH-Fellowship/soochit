import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soochit/stores/login_store.dart';
import 'package:soochit/global/myColors.dart';

/* TODO: Remove and modify as per requirement. This is just has the signOut function*/
class HomePage extends StatefulWidget {
  static String id="home_page";
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  loginStore.signOut(context);
                },
                color: MyColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14))
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Sign Out', style: TextStyle(color: Colors.white),),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: MyColors.lightestPink,
                        ),
                        child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,),
                      )
                    ],
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
