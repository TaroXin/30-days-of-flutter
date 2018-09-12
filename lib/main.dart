import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './home.dart';
import './router/index.dart';
import './application.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  App() {
    final router = new Router();
    RouterManager.registerRouter(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '30DaysOfFlutter',
      home: new Home(),
    );
  }
}
