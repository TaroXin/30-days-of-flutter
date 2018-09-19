import 'package:flutter/material.dart';

class Day12 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Day12State();
  }
}

class _Day12State extends State<Day12> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      image: DecorationImage (
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/avatar.png')
                      )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text('TaroXin', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text('15029352778@163.com', style: TextStyle(color: Colors.white),),
                  )
                ],
              ),

              decoration: new BoxDecoration(
                  color: Colors.blueGrey
              ),
            ),

            ListTile(
              leading: Icon(Icons.map),
              title: Text('你的地点'),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(Icons.keyboard),
              title: Text('你的贡献'),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(Icons.compare),
              title: Text('离线区域'),
              onTap: () {
              },
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.streetview),
              title: Text('实时路况'),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('公交线路'),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(Icons.linear_scale),
              title: Text('骑车线路'),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(Icons.photo),
              title: Text('卫星图像'),
              onTap: () {
              },
            ),

            ListTile(
              leading: Icon(Icons.streetview),
              title: Text('地形'),
              onTap: () {
              },
            ),
          ],
        ),
      ),

      appBar: new AppBar(
        title: new Text('Swiper menu'),
        backgroundColor: Colors.blueGrey,
      ),

      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('点击左上角打开侧边栏'),

            new RaisedButton(
              child: new Text('返回'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}