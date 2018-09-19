import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../day1/index.dart';
import '../day2/index.dart';
import '../day3/index.dart';
import '../day4/index.dart';
import '../day5/index.dart';
import '../day6/index.dart';
import '../day7/index.dart';
import '../day8/index.dart';
import '../day9/index.dart';
import '../day10/index.dart';
import '../day11/index.dart';

class RouterManager {
  static String day1 = '/day1';
  static String day2 = '/day2';
  static String day3 = '/day3';
  static String day4 = '/day4';
  static String day5 = '/day5';
  static String day6 = '/day6';
  static String day7 = '/day7';
  static String day8 = '/day8';
  static String day9 = '/day9';
  static String day10 = '/day10';
  static String day11 = '/day11';

  static final routes = {
    'day1': {
      'routerName': day1,
      'handler': day1Handler,
      'key': 'Day1',
      'title': 'PageView 页面切换',
      'icon': 'assets/images/tab.png',
    },
    'day2': {
      'routerName': day2,
      'handler': day2Handler,
      'key': 'Day2',
      'title': 'Banner 示例',
      'icon': 'assets/images/banner.png',
    },
    'day3': {
      'routerName': day3,
      'handler': day3Handler,
      'key': 'Day3',
      'title': 'ListView 相关使用',
      'icon': 'assets/images/list.png',
    },
    'day4': {
      'routerName': day4,
      'handler': day4Handler,
      'key': 'Day4',
      'title': '自定义导航栏',
      'icon': 'assets/images/nav.png',
    },
    'day5': {
      'routerName': day5,
      'handler': day5Handler,
      'key': 'Day5',
      'title': '自定义底部导航栏',
      'icon': 'assets/images/btm_nav.png',
    },
    'day6': {
      'routerName': day6,
      'handler': day6Handler,
      'key': 'Day6',
      'title': 'Flutter 动画入门, AnimationList示例',
      'icon': 'assets/images/animate.png',
    },
    'day7': {
      'routerName': day7,
      'handler': day7Handler,
      'key': 'Day7',
      'title': 'Backdrop示例',
      'icon': 'assets/images/backdrop.png',
    },
    'day8': {
      'routerName': day8,
      'handler': day8Handler,
      'key': 'Day8',
      'title': 'Flexible appbar 示例',
      'icon': 'assets/images/toolbar.png',
    },
    'day9': {
      'routerName': day9,
      'handler': day9Handler,
      'key': 'Day9',
      'title': 'Tabbar 示例',
      'icon': 'assets/images/tabbar.png',
    },
    'day10': {
      'routerName': day10,
      'handler': day10Handler,
      'key': 'Day10',
      'title': '扫描二维码示例',
      'icon': 'assets/images/scanner.png',
    },
    'day11': {
      'routerName': day11,
      'handler': day11Handler,
      'key': 'Day11',
      'title': '网易云歌单详情页面模仿',
      'icon': 'assets/images/playlist.png',
    },
  };

  static void registerRouter(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map params) {
        print('Route is not found!');
      }
    );

    routes.forEach((key, value) {
      router.define(value['routerName'], handler: value['handler']);
    });
  }
}

var day1Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day1();
  }
);

var day2Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day2();
  }
);

var day3Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day3();
  }
);

var day4Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day4();
  }
);

var day5Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day5();
  }
);

var day6Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day6();
  }
);

var day7Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day7();
  }
);

var day8Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day8();
  }
);

var day9Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day9();
  }
);

var day10Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day10();
  }
);

var day11Handler = new Handler(
  handlerFunc: (context, params) {
    return new Day11();
  }
);
