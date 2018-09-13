import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _CustomBottomAppBarState();
  }
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return new BottomAppBar(
      child: Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.more_vert),
            onPressed: () {}
          ),

          new Expanded(
            child: SizedBox(),
          )
        ],
      ),

      color: Colors.blue,
      shape: CircularNotchedRectangle(),
    );
  }
}
