import 'package:flutter/material.dart';
import './home.dart';
import './routes.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '30DaysOfFlutter',
      home: new Home(),
      routes: routes,
    );
  }
}


