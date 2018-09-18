import 'package:flutter/material.dart';

class Day11 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Day11State();
  }
}

class _Day11State extends State<Day11> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Day11',
              style: new TextStyle(
                fontSize: 18.0
              ),
            ),

            new Text(
              '这里是Day11的描述内容, 这里的内容可能会很长会很长会很长会很长',
              style: new TextStyle(
                fontSize: 12.0,
                color: new Color(0xFFC0C0C0),
              ),
            )
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
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


      body: new Container(
        color: Colors.blueGrey,
        child: new Column(
          children: <Widget>[
            // 图片
            new Container(
              height: 120.0,
            ),
            // 操作栏
            new Container(
              height: 56.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new OperationItem(Icons.comment, '评论'),
                  new OperationItem(Icons.share, '分享'),
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
                color: Colors.white
              ),
              height: 56.0,
            )
            // 列表
          ],
        ),
      ),
    );
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