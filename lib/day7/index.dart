import 'package:flutter/material.dart';
import './dropPanel.dart';

class Day7 extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    return _Day7State();
  }
}

// Dart2语法中，构造器前面的new关键字可省略
class _Day7State extends State<Day7> with SingleTickerProviderStateMixin{
  final GlobalKey _backdropKey = new GlobalKey(debugLabel: 'Backdrop');
  AnimationController _controller;
  List titles;
  int currentIndex;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: new Duration(milliseconds: 300),
      value: 1.0,
      vsync: this
    );

    titles = ['Option first', 'Option second', 'Option third'];
    currentIndex = 0;
  }

  void _changeSelect(index) {
    setState(() {
      currentIndex = index;
      _toggleDropPanelVisible();
    });
  }

  void _toggleDropPanelVisible() {
    AnimationStatus status = _controller.status;
    final dropPanelVisible = status == AnimationStatus.completed || status == AnimationStatus.forward;
    _controller.fling(velocity: dropPanelVisible ? -2.0 : 2.0);
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final double panelTitleHeight = 48.0;
    final Size panelSize = constraints.biggest; // 盒子约束的最大Size
    final panelTop = panelSize.height - panelTitleHeight;

    final Animation<RelativeRect> panelAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
        0.0,
        panelTop - MediaQuery.of(context).padding.bottom,
        0.0,
        panelTop - panelSize.height,
      ),
      end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    ThemeData theme = Theme.of(context);
    List<Widget> backdropItems = List.generate(titles.length, (index) {
      final String title = titles[index];
      final bool selected = currentIndex == index;

      return Material(
        color: selected ? Colors.white.withOpacity(0.25) : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0))
        ),
        child: ListTile(
          title: Text(title),
          selected: selected,
          onTap: () => _changeSelect(index),
        ),
      );
    });

    return new Container(
      key: _backdropKey,
      color: theme.primaryColor,
      child: Stack(
        children: <Widget>[
          ListTileTheme(
            iconColor: theme.primaryIconTheme.color,
            textColor: theme.primaryTextTheme.title.color.withOpacity(0.6),
            selectedColor: theme.primaryTextTheme.title.color,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: backdropItems,
              ),
            ),
          ),

          PositionedTransition(
            rect: panelAnimation,
            child: DropPanel(titles[currentIndex]),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // 去除AppBar底部的阴影
        title: Text('BackDrop'),
        actions: <Widget>[
          IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _controller.view,
            ),
            onPressed: _toggleDropPanelVisible
          )
        ],
      ),
      
      body: LayoutBuilder(
        builder: _buildStack,
      ),
    );
  }
}
