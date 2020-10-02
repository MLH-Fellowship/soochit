import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  //
  final String payload;

  NotificationScreen({this.payload});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Screen'),
      ),
      body: Center(
        child: Text(widget.payload),
      ),
    );
  }
}
