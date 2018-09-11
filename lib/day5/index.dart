import 'package:flutter/material.dart';
import './CustomBottomNavigator.dart';
import './customNavigatorItem.dart';

class Day5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Day5State();
  }
}

class _Day5State extends State<Day5> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('自定义底部导航栏'),
      ),

      body: new Center(
        child: new Text('Body'),
      ),

      bottomNavigationBar: new CustomNavigator(
        items: new List.generate(4, (index) {
          return new CustomNavigatorItem(
            icon: new Icon(Icons.ac_unit),
            title: '页面',
          );
        }),
      ),
    );
  }
}
