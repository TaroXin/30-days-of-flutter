import 'package:flutter/material.dart';
import './day1/index.dart';
import './day2/index.dart';

final routes = {
  'day1': (BuildContext context) => new Day1(),
  'day2': (BuildContext context) => new Day2(),
};

final routesDescription = [
  {
    'key': 'Day 1',
    'title': 'PageView 页面切换',
    'icon': 'assets/images/tab.png',
  },

  {
    'key': 'Day 2',
    'title': 'Banner 示例',
    'icon': 'assets/images/banner.png',
  },
];