import 'package:flutter/material.dart';

class Day9 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Day9State();
  }
}

class _Day9State extends State<Day9> with SingleTickerProviderStateMixin {
  TabController _controller;
  List<_Page> allPages = [];
  
  @override
  void initState() {
    super.initState();
    allPages.add(_Page(icon: Icons.grade, text: 'TRIUMPH'));
    allPages.add(_Page(icon: Icons.playlist_add, text: 'NOTE'));
    allPages.add(_Page(icon: Icons.check_circle, text: 'SUCCESS'));
    allPages.add(_Page(icon: Icons.question_answer, text: 'OVERSTATE'));
    allPages.add(_Page(icon: Icons.sentiment_very_satisfied, text: 'SATISFACTION'));
    allPages.add(_Page(icon: Icons.camera, text: 'APERTURE'));
    allPages.add(_Page(icon: Icons.assignment_late, text: 'WE MUST'));
    allPages.add(_Page(icon: Icons.assignment_turned_in, text: 'WE CAN'));
    allPages.add(_Page(icon: Icons.group, text: 'ALL'));
    allPages.add(_Page(icon: Icons.block, text: 'EXCEPT'));
    allPages.add(_Page(icon: Icons.sentiment_very_dissatisfied, text: 'CRYING'));
    allPages.add(_Page(icon: Icons.error, text: 'MISTAKE'));
    allPages.add(_Page(icon: Icons.loop, text: 'TRYING'));
    allPages.add(_Page(icon: Icons.cake, text: 'CAKE'));
    _controller = new TabController(length: allPages.length, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tabbar示例'),
        bottom: new TabBar(
          isScrollable: true,
          controller: _controller,
          tabs: allPages.map((_Page page) {
            return new Tab(icon: Icon(page.icon), text: page.text);
          }).toList(),
        ),
      ),

      body: new TabBarView(
        controller: _controller,
        children: allPages.map((_Page page) {
          return new Padding(
            padding: EdgeInsets.all(16.0),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Icon(page.icon, size: 96.0),

                  new Padding(
                    padding: EdgeInsets.only(top: 32.0),
                    child: new Text(page.text),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _Page {
  final IconData icon;
  final String text;

  _Page({this.icon, this.text});
}