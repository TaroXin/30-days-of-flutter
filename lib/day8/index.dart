import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:english_words/english_words.dart';

class Day8 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Day8State();
  }
}

class _Day8State extends State<Day8> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final double _appbarHeight = 256.0;
  List<WordPair> _wordsList;

  @override
  void initState() {
    super.initState();
    _wordsList = [];
    _wordsList.addAll(generateWordPairs().take(30));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appbarHeight,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text('Scarlett'),
              background: new Stack(
                children: <Widget>[
                  new Image.asset(
                    'assets/images/scarlett.jpg',
                    height: 300.0,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),

          new SliverList(
            delegate: SliverChildListDelegate([
              _ContactCategory(
                icon: Icons.call,
                children: <Widget>[
                  _ContactItem(
                    icon: Icons.message,
                    tooltip: 'Send message',
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: Text('Pretend that this opened your SMS application.')
                      ));
                    },
                    lines: const <String>[
                      '(650) 555-1234',
                      'Mobile',
                    ],
                  ),
                  _ContactItem(
                    icon: Icons.message,
                    tooltip: 'Send message',
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: Text('A messaging app appears.')
                      ));
                    },
                    lines: const <String>[
                      '(323) 555-6789',
                      'Work',
                    ],
                  ),
                  _ContactItem(
                    icon: Icons.message,
                    tooltip: 'Send message',
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: Text('Imagine if you will, a messaging application.')
                      ));
                    },
                    lines: const <String>[
                      '(650) 555-6789',
                      'Home',
                    ],
                  ),
                ],
              ),

              _ContactCategory(
                icon: Icons.call,
                children: <Widget>[
                  _ContactItem(
                    icon: Icons.message,
                    tooltip: 'Send message',
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: Text('Pretend that this opened your SMS application.')
                      ));
                    },
                    lines: const <String>[
                      '(650) 555-1234',
                      'Mobile',
                    ],
                  ),
                  _ContactItem(
                    icon: Icons.message,
                    tooltip: 'Send message',
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: Text('A messaging app appears.')
                      ));
                    },
                    lines: const <String>[
                      '(323) 555-6789',
                      'Work',
                    ],
                  ),
                  _ContactItem(
                    icon: Icons.message,
                    tooltip: 'Send message',
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: Text('Imagine if you will, a messaging application.')
                      ));
                    },
                    lines: const <String>[
                      '(650) 555-6789',
                      'Home',
                    ],
                  ),
                ],
              ),

              _ContactCategory(
                icon: Icons.call,
                children: <Widget>[
                  _ContactItem(
                    icon: Icons.message,
                    tooltip: 'Send message',
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: Text('Pretend that this opened your SMS application.')
                      ));
                    },
                    lines: const <String>[
                      '(650) 555-1234',
                      'Mobile',
                    ],
                  ),
                  _ContactItem(
                    icon: Icons.message,
                    tooltip: 'Send message',
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: Text('A messaging app appears.')
                      ));
                    },
                    lines: const <String>[
                      '(323) 555-6789',
                      'Work',
                    ],
                  ),
                  _ContactItem(
                    icon: Icons.message,
                    tooltip: 'Send message',
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: Text('Imagine if you will, a messaging application.')
                      ));
                    },
                    lines: const <String>[
                      '(650) 555-6789',
                      'Home',
                    ],
                  ),
                ],
              ),
            ]))
        ],
      ),
    );
  }
}

class _ContactCategory extends StatelessWidget {
  const _ContactCategory({ Key key, this.icon, this.children }) : super(key: key);

  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: themeData.dividerColor))
      ),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.subhead,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  width: 72.0,
                  child: Icon(icon, color: themeData.primaryColor)
              ),
              Expanded(child: Column(children: children))
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  _ContactItem({ Key key, this.icon, this.lines, this.tooltip, this.onPressed })
      : assert(lines.length > 1),
        super(key: key);

  final IconData icon;
  final List<String> lines;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<Widget> columnChildren = lines.sublist(0, lines.length - 1).map((String line) => Text(line)).toList();
    columnChildren.add(Text(lines.last, style: themeData.textTheme.caption));

    final List<Widget> rowChildren = <Widget>[
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columnChildren
          )
      )
    ];
    if (icon != null) {
      rowChildren.add(SizedBox(
          width: 72.0,
          child: IconButton(
              icon: Icon(icon),
              color: themeData.primaryColor,
              onPressed: onPressed
          )
      ));
    }
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rowChildren
        )
    );
  }
}
