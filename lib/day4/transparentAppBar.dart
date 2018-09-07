import 'package:flutter/material.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class TransparentAppBar extends StatefulWidget {
  final Widget title;
  final Widget leading;
  final Widget trailing;
  final double opacity;

  TransparentAppBar({Key key, this.title, this.leading, this.trailing, this.opacity}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TransparentAppBarState(
      title: title,
      leading: leading,
      trailing: trailing,
      opacity: opacity
    );
  }
}

class _TransparentAppBarState extends State<TransparentAppBar> {
  double statusBarHeight = 0.0;
  final Widget title;
  final Widget leading;
  final Widget trailing;
  final double opacity;

  _TransparentAppBarState({this.title, this.leading, this.trailing, this.opacity});

  @override
  void initState() {
    super.initState();
    getStatusHeight();
  }

  void getStatusHeight() async {
    statusBarHeight = await FlutterStatusbarManager.getHeight;
    setState(() {
      statusBarHeight = statusBarHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: (56.0 + statusBarHeight),
      padding: EdgeInsets.only(top: statusBarHeight),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          leading != null ?
            leading :
            new Container(),

          title != null ?
            new Expanded(
              child: title,
            ) :
            new Container(),

          trailing != null ?
            trailing :
            new Container(),
        ],
      ),
    );
  }
}