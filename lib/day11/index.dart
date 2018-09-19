import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';

class Day11 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Day11State();
  }
}

int _primaryColor = 0xFF6495BD;
int _secondTextColor = 0xFFD9D9D9;

class _Day11State extends State<Day11> {
  var playlist;

  @override
  void initState() {
    super.initState();
    Dio dio = new Dio();
    dio
      .get('https://www.easy-mock.com/mock/5b6123426551d73d7139272d/getSmsCode/playlist/detail')
      .then((res) {
        if (res.statusCode == 200 && res.data['code'] == 200) {
          setState(() {
            playlist = res.data['playlist'];
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '歌单',
              style: new TextStyle(
                fontSize: 16.0
              ),
            ),

            new Text(
              '根据你收藏的单曲《二人转》推荐',
              style: new TextStyle(
                fontSize: 12.0,
                color: new Color(_secondTextColor),
              ),
            )
          ],
        ),
        elevation: 0.0,
        backgroundColor: Color(_primaryColor),
        titleSpacing: 0.0,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {}
          ),

          new PopupMenuButton(
            icon: new Icon(Icons.more_vert),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem>[
                new PopupMenuItem(
                  child: new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: new Icon(Icons.sort),
                      ),
                      new Text('选择歌曲排序')
                    ],
                  ),
                  value: 'sort',
                ),

                new PopupMenuItem(
                  child: new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: new Icon(Icons.delete),
                      ),
                      new Text('清空下载文件')
                    ],
                  ),
                  value: 'delete',
                )
              ];
            }
          )
        ],
      ),


      body: new SingleChildScrollView(
        child: new Container(
          color: Color(_primaryColor),
          child: new Column(
            children: <Widget>[
              // 图片
              new Container(
                height: 120.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: new Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: new Image.asset('assets/images/cover.jpg'),
                    ),

                    new Expanded(
                      child: new Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                              '聆听优质的中文说唱 Flow Vol.1',
                              style: new TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),

                            new Row(
                              children: <Widget>[
                                playlist != null ?
                                  new Container(
                                    child: new CircleAvatar(
                                      backgroundImage: new NetworkImage(
                                        playlist['creator']['avatarUrl'],
                                      ),
                                    ),
                                    width: 24.0,
                                    height: 24.0,
                                  ) :
                                  new Image.asset(
                                    'assets/images/default_head.png',
                                    height: 24.0,
                                    width: 24.0,
                                  ),


                                new Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: new Text(
                                    playlist != null ? playlist['creator']['nickname'] : '名称',
                                    style: new TextStyle(
                                      color: Color(_secondTextColor),
                                    ),
                                  ),
                                ),

                                new Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Color(_secondTextColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // 操作栏
              new Container(
                height: 56.0,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new OperationItem(Icons.comment, playlist != null ? playlist['commentCount'].toString() : '评论'),
                    new OperationItem(Icons.share, playlist != null ? playlist['shareCount'].toString() : '分享'),
                    new OperationItem(Icons.file_download, '下载'),
                    new OperationItem(Icons.check_box, '多选'),
                  ],
                ),
              ),
              // 标题
              new Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  color: Colors.white,
                ),
                height: 48.0,
                child: new Row(
                  children: playlist == null ? [] : <Widget>[
                    new Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: new Icon(Icons.play_circle_outline),
                    ),
                    new Text('播放全部'),
                    new Expanded(
                      child: new Text('(共${playlist['tracks'].length}首)'),
                    ),

                    new Container(
                      height: 56.0,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(16.0)),
                        color: Colors.redAccent,
                      ),
                      child: new Row(
                        children: <Widget>[
                          new Icon(Icons.add, color: Colors.white),
                          new Text('收藏', style: new TextStyle(color: Colors.white)),
                          new Text('(${playlist['subscribedCount']})', style: new TextStyle(color: Colors.white))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // 列表
              new Container(
                child: new TrackList(playlist != null ? playlist['tracks'] : new List()),
                decoration: new BoxDecoration(
                  border: playlist != null ? Border(top: BorderSide(color: Color(0xFFEBEBEB), width: 0.5)) : null,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrackList extends StatelessWidget {
  final List tracks;

  TrackList(this.tracks);

  @override
  Widget build(BuildContext context) {
    if (tracks.length > 0) {
      return new Container();
    } else {
      return new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: new SpinKitWave(
                color: Colors.redAccent,
                size: 14.0,
              ),
            ),

            new Text(
              '努力加载中...',
              style: new TextStyle(
                color: Color(_secondTextColor)
              ),
            ),
          ],
        ),
      );
    }
  }
}

class OperationItem extends StatefulWidget {
  final IconData icon;
  final String title;

  OperationItem(this.icon, this.title);

  @override
  State<StatefulWidget> createState() {
    return _OperationItem();
  }
}

class _OperationItem extends State<OperationItem> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: (details) {
        setState(() {
          isTap = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isTap = false;
        });
      },
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new IconTheme(
            data: new IconThemeData(
              opacity: isTap ? 0.5 : 1.0,
            ),
            child: new Icon(
              widget.icon,
              color: Colors.white,
            ),
          ),
          new Text(
            widget.title,
            style: new TextStyle(
                fontSize: 12.0,
                color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}