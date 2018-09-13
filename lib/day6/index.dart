import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Day6 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _Day6State();
  }
}

class _Day6State extends State<Day6> {
  GlobalKey<AnimatedListState> _listKey = new GlobalKey();
  List<WordPair> itemList = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    itemList.addAll(generateWordPairs().take(3));
  }

  void insertItem() {
    // 向列表中新增一个元素
    itemList.insert(currentIndex, WordPair.random());
    _listKey.currentState.insertItem(currentIndex);
  }

  void removeItem() {
    if (itemList.length == 0) {
      print('列表中已经没有元素了');
      return;
    }
    // 删除当前选中的一个元素
    WordPair removeItem = itemList.removeAt(currentIndex);
    if (currentIndex > itemList.length - 1) {
      currentIndex = itemList.length - 1;
    }

    if (currentIndex < 0) {
      currentIndex = 0;
    }

    _listKey.currentState.removeItem(currentIndex, (context, animation) {
      return new CardItem(
        animation: animation,
        index: currentIndex,
        title: removeItem.asPascalCase,
        isSelected: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Animated List'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add_circle_outline),
            onPressed: insertItem,
            tooltip: '新增元素',
          ),

          new IconButton(
            icon: new Icon(Icons.remove_circle_outline),
            onPressed: removeItem,
            tooltip: '删除当前选中的元素',
          ),

        ],
      ),

      body: new Padding(
        padding: EdgeInsets.all(16.0),
        child: new AnimatedList(
          key: _listKey,
          initialItemCount: itemList.length,
          itemBuilder: (context, index, animation) {
            return new CardItem(
              animation: animation,
              index: index,
              title: itemList[index].asPascalCase,
              isSelected: index == currentIndex,
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
            );
          }
        ),
      )
    );
  }
}

class CardItem extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onTap;
  final int index;
  final title;
  final bool isSelected;


  CardItem({
    this.animation,
    this.onTap,
    this.index,
    this.title,
    this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (isSelected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }

    return new Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: new GestureDetector(
          onTap: onTap,
          child: new SizedBox(
            height: 120.0,
            child: new Card(
              color: Colors.primaries[index % Colors.primaries.length],
              child: new Center(
                child: new Text('Item $index: $title', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
