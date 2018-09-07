import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class Day3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Day3State();
  }
}

class _Day3State extends State<Day3> {
  List<WordPair> _wordList;
  
  @override
  void initState() {
    super.initState();
    // english_words是随机生成英文单词的库，官网: https://github.com/filiph/english_words
    _wordList = new List();
    _wordList.addAll(generateWordPairs().take(20));
  }

  Future onRefresh() {
    // 下拉刷新方法中必须返回一个 Future, 这里采用了模拟网络请求的方法来返回一个 Future
    return Future.delayed(new Duration(seconds: 3), () {
      setState(() {
        _wordList.clear();
        _wordList.addAll(generateWordPairs().take(20));
      });
    });
  }

  bool onNotification(ScrollNotification notification) {
    // 这里是针对上拉加载的解决方案，因为Flutter并没有直接提供上拉加载的控件
    // 这里选择滚动到最底部进行加载，你也可以选择设定一定的数值，例如: notification.metrics.extentAfter <= 200.0
    if (notification is ScrollEndNotification && notification.metrics.extentAfter == 0.0) {
      Fluttertoast.showToast(
        msg: '加载更多'
      );

      setState(() {
        _wordList.addAll(generateWordPairs().take(20));
      });
    }

    return false;
  }

  void onDismissed(index) {
    // 当滑动删除一个Item时，将它从 list 中删除
    setState(() {
      _wordList.removeAt(index);
    });
  }

  void onTilePressed(index) {
    Fluttertoast.showToast(
      msg: '我是第$index个, 点我作甚?'
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView相关示例'),
      ),

      body: new NotificationListener(
        onNotification: onNotification,
        child: new RefreshIndicator(
          child: new ListView.builder(
            itemCount: _wordList.length,

            itemBuilder: (context, index) {
              return new Dismissible(
                key: new Key(_wordList[index].asPascalCase),

                onDismissed: (direction) => onDismissed(index),

                child: new Column(
                  children: <Widget>[
                    ListTile(
                      leading: new Icon(Icons.title),
                      title: new Text(_wordList[index].asPascalCase),
                      subtitle: new Text('这是一段描述信息'),
                      trailing: new Icon(Icons.keyboard_arrow_right),
                      onTap: () => onTilePressed(index),
                    ),

                    Divider(height: 5.0)
                  ],
                )
              );
            },

          ),
          onRefresh: onRefresh
        ),
      ),
    );
  }
}