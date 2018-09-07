import 'package:flutter/material.dart';

class Day1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Day1State();
  }
}

class Day1State extends State<Day1> {
  int _currentPageIndex = 0;
  int _pageCount = 4;
  List<BottomNavigationBarItem> items;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    // 初始化底部导航栏
    items =  List.generate(_pageCount, (index) {
      return new BottomNavigationBarItem(
        icon: new Icon(Icons.pages),
        title: new Text('界面'),
        backgroundColor: Colors.blue,
      );
    });
  }

  void onPageChanged(index, {needSwitchPage: false}) {
    if (needSwitchPage) {
      // 点击下面的导航栏时，才主动切换PageView的选中状态
      // curve 参数是切换页面时的动画效果
      _pageController.animateToPage(
        index,
        duration: new Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PageView切换示例'),
      ),
      
      body: new PageView.builder(
        itemCount: _pageCount,
        controller: _pageController,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return new Center(
            child: new Text('Page ${index + 1}'),
          );
        },
      ),

      bottomNavigationBar: new BottomNavigationBar(
        items: items,
        currentIndex: _currentPageIndex,
        onTap: (index) => onPageChanged(index, needSwitchPage: true),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}