import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './loading.dart';
import './banner.dart';
import './bannerModel.dart';

class Day2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Day2State();
  }
}

class _Day2State extends State<Day2> {
  List<BannerModel> _bannerList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // 这里使用 Dio 请求网络，文档请访问Dio主页: https://github.com/flutterchina/dios
    Dio dio = new Dio();
    dio
      .get('https://www.easy-mock.com/mock/5b6123426551d73d7139272d/getSmsCode/banner') // 这个Mock平台相当之慢
      .then((Response res) {
        // 这里是 Dart 的 Future, 相当于 Js 中的 Promise, 当然也可以将本方法改装成 async/await 的形式
        final data = res.data;
        if (res.statusCode == 200 && data['code'] == 200) {
          // 根据接口返回的内容生成List
          setState(() {
            _bannerList = new List.generate(data['banners'].length, (index) {
              return new BannerModel.fromJson(data['banners'][index]);
            });

            isLoading = false;
          });
          // PS: 在 initState 方法中修改 state 可以直接修改，如果不再该方法中，则需要调用 setState 通知 UI 渲染
          // 但是当前的数据返回是运行在 Future 中，而 initState 是同步的，所以同样需要 setState 方法
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Banner示例'),
      ),

      body: new Center(
        child: isLoading ? new Loading() : new BannerComponent(_bannerList),
      ),
    );
  }
}