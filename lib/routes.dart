import 'package:flutter/material.dart';
import './day1/index.dart';
import './day2/index.dart';
import './day3/index.dart';
import './day4/index.dart';
import './day5/index.dart';

final routes = {
  'day1': (BuildContext context) => new Day1(),
  'day2': (BuildContext context) => new Day2(),
  'day3': (BuildContext context) => new Day3(),
  'day4': (BuildContext context) => new Day4(),
  'day5': (BuildContext context) => new Day5(),
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

  {
    'key': 'Day 3',
    'title': 'ListView相关使用',
    'icon': 'assets/images/list.png',
  },

  {
    'key': 'Day 4',
    'title': '自定义导航栏',
    'icon': 'assets/images/nav.png',
  },

  {
    'key': 'Day 5',
    'title': '自定义底部导航栏',
    'icon': 'assets/images/btm_nav.png',
  },
];