import 'package:flutter/material.dart';
import './router/index.dart';
import './application.dart';
import 'package:fluro/fluro.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('30天Flutter学习'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: null
          )
        ],
      ),

      body: new ListView.builder(
        itemCount: RouterManager.routes.length,
        itemBuilder: (context, index) {
          final route = RouterManager.routes[RouterManager.routes.keys.toList()[index]];
          final routeName = route['routerName'];
          final key = route['key'];
          final title = route['title'];
          final icon = route['icon'];

          return new ListTile(
            leading: new Image(
              image: new AssetImage(icon),
              width: 30.0,
              height: 30.0,
            ),
            title: new Text(title),
            subtitle: new Text(key),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
//              Application.router.navigateTo(context, routeName, transition: TransitionType.inFromRight);
              Application.router.navigateTo(context, routeName);
            },
          );
        },
      )
    );
  }
}