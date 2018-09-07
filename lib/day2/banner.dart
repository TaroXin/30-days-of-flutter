import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import './bannerModel.dart';
import 'dart:async';

class BannerComponent extends StatefulWidget {
  final List<BannerModel> bannerList;

  BannerComponent(this.bannerList);

  @override
  State<StatefulWidget> createState() {
    return _BannerComponentState(this.bannerList);
  }
}

class _BannerComponentState extends State<BannerComponent> {
  final List<BannerModel> bannerList;
  PageController _pageController;
  int _activeIndex;

  _BannerComponentState(this.bannerList);

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    _activeIndex = 0;
    autoRun();
  }

  void autoRun() {
    Future.delayed(new Duration(seconds: 3), () {
      // 判断当前页面的状态，mounted代表当前页面是聚焦状态
      if (mounted) {
        if (_activeIndex == bannerList.length - 1) {
          _activeIndex = 0;
        } else {
          _activeIndex += 1;
        }

        _pageController.animateToPage(
            _activeIndex,
            duration: new Duration(milliseconds: 500),
            curve: Curves.easeInOut
        );

        // 在这里才调用setState是为了切换后才改变UI的状态
        setState(() {
          _activeIndex = _activeIndex;
        });

        autoRun();
      }
    });
  }

  void onPageChanged(index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      child: new Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          new PageView.builder(
            controller: _pageController,
            onPageChanged: onPageChanged,
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              final bannerModel = bannerList[index];

              return new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: bannerModel.picUrl,
                fit: BoxFit.fill,
              );
            },
          ),

          new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: new List<Widget>.generate(
                bannerList.length,
                (index) {
                  return new Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: new Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: new BoxDecoration(
                        color: _activeIndex == index ? Colors.blue : Colors.transparent,
                        shape: BoxShape.circle,
                        border: new Border.all(color: Colors.grey[300]),
                      ),
                    ),
                  );
                }
              )
          )
        ],
      ),
    );
  }
}