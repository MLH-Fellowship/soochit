import 'package:flutter/material.dart';
import 'package:soochit/global/myColors.dart';

Widget getSnackBar(BuildContext context, String text) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: MyColors.white,
    content: Text(
      text,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          color: MyColors.primaryColor, fontFamily: 'lexenddeca'),
    ),
  );
}