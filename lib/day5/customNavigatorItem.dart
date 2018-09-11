import 'package:flutter/material.dart';

class CustomNavigatorItem extends StatelessWidget {
  final Icon icon;
  final String title;

  CustomNavigatorItem({
    this.icon,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        icon != null ? new IconTheme(
          data: new IconThemeData(
            color: Colors.white
          ),
          child: icon
        ): new Container(),
        title != null ? new Text(
          title,
          style: new TextStyle(
            color: Colors.white,
          ),
        ) : new Text('标题'),
      ],
    );
  }
}