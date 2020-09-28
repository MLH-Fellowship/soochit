import 'package:flutter/material.dart';
import 'package:soochit/global/myColors.dart';
import 'package:soochit/global/myDimens.dart';

class LoaderHUD extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator = Container(
    width: MyDimens.double_200,
    height: MyDimens.double_100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(MyDimens.double_4)),
      color: MyColors.primaryColor.withOpacity(0.6),
    ),
    child: const Center(child: CircularProgressIndicator()),
  );
  final bool dismissible;
  final Widget child;

  LoaderHUD({
    Key key,
    @required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = MyColors.lightestPink,
    this.dismissible = false,
    @required this.child,
  })  : assert(child != null),
        assert(inAsyncCall != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;

    return Stack(
      children: [
        child,
        Opacity(
          child: ModalBarrier(dismissible: dismissible, color: color),
          opacity: opacity,
        ),
        Center(child: progressIndicator),
      ],
    );
  }
}
