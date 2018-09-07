import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './transparentAppBar.dart';
import './transparentScaffold.dart';

class Day4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Day4State();
  }
}

class _Day4State extends State<Day4> {
  List<WordPair> _wordList;

  @override
  void initState() {
    super.initState();
    _wordList = new List();
    _wordList.addAll(generateWordPairs().take(20));
  }

  @override
  Widget build(BuildContext context) {
    return new TransparentScaffold(
      appBar: new TransparentAppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),

        trailing: new IconButton(
          icon: new Icon(
            Icons.share,
            color: Colors.white,
          ),
          onPressed: () {}
        ),
      ),
      
      body: new Column(
        children: <Widget>[
          new Image(
            height: 200.0,
            fit: BoxFit.fill,
            image: new AssetImage('assets/images/banner_top.jpeg'),
          ),

          new Expanded(
            child: new ListView.builder(
              itemCount: _wordList.length,
              itemBuilder: (context, index) {
                return new ListTile(
                  title: new Text(_wordList[index].asPascalCase)
                );
              },
            )
          )
        ],
      ),
    );
  }
}