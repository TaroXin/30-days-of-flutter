import 'package:flutter/material.dart';
import './routes.dart';

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
        itemCount: routes.length,
        itemBuilder: (context, index) {
          final routeName = routes.keys.toList()[index];
          final key = routesDescription[index]['key'];
          final title = routesDescription[index]['title'];
          final icon = routesDescription[index]['icon'];
          return new ListTile(
            leading: new Image(
              image: new AssetImage(icon),
              width: 30.0,
              height: 30.0,
            ),
            title: new Text(title),
            subtitle: new Text(key),
            onTap: () {
              Navigator.of(context).pushNamed(routeName);
            },
          );
        },
      )
    );
  }
}