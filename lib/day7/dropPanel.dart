import 'package:flutter/material.dart';

class DropPanel extends StatelessWidget {
  final String title;
  DropPanel(this.title);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 48.0,
              alignment: Alignment.centerLeft,
              child: Text(title),
            ),

            Expanded(
              child: Center(
                child: Text('这里是内容区域'),
              ),
            )
          ],
        ),
      ),
    );
  }
}