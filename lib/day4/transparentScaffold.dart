import 'package:flutter/material.dart';
import './transparentAppBar.dart';

class TransparentScaffold extends StatelessWidget {
  final TransparentAppBar appBar;
  final Widget body;

  TransparentScaffold({this.appBar, this.body});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          body != null ?
            body :
            new Container(),

          appBar != null ?
            appBar :
            new Container(),
        ],
      ),
    );
  }
}