// 存储Banner信息的模版
class BannerModel {
  String picUrl;
  String backgroundUrl;

  // 自定义fromJson, 方便的直接从Map转化到实体
  BannerModel.fromJson(Map<String, dynamic> json)
      : picUrl = json['picUrl'],
        backgroundUrl = json['backgroundUrl'];
}