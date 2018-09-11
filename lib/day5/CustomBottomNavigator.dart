import 'package:flutter/material.dart';
import './customNavigatorItem.dart';
import 'dart:math' as Math;

const double _topMargin = 6.0;
const double _bottomMargin = 8.0;
const double _barHeight = 56.0;

class CustomNavigator extends StatefulWidget {
  final List<CustomNavigatorItem> items;

  CustomNavigator({
    Key key,
    this.items
  }) :
    assert(items != null),
    assert(items.length >= 2),
    super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _CustomNavigatorState();
  }
}

class _CustomNavigatorState extends State<CustomNavigator> {
  @override
  Widget build(BuildContext context) {
    final bottomPadding = Math.max(MediaQuery.of(context).padding.bottom - _bottomMargin, 0.0);
    final barHeight = _barHeight + _topMargin + (bottomPadding == 0.0 ? _bottomMargin : bottomPadding);

    return new Container(
      height: barHeight,
      color: Colors.blue,
      padding: EdgeInsets.only(bottom: bottomPadding, top: _topMargin),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items,
      ),
    );
  }
}