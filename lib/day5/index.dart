import 'package:flutter/material.dart';
import './customBottomAppBar.dart';

class Day5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Day5State();
  }
}

// 示例来自FlutterGallery项目 路径: https://github.com/flutter/flutter/blob/23499f400422153cdf6ee8c34046bd0dd0f13d48/examples/flutter_gallery/lib/demo/material/bottom_app_bar_demo.dart
class _Day5State extends State<Day5> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  
  void showMessage() {
    _key.currentState.showSnackBar(SnackBar(
      content: new Text('测试消息'),
      backgroundColor: Colors.orangeAccent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _key,
      appBar: new AppBar(
        title: new Text('自定义底部导航栏'),
      ),

      body: new Center(
        child: new Text('Body'),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
        onPressed: showMessage,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new CustomBottomAppBar(
      )
    );
  }
}

