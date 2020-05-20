import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class VideoProviderModel extends ChangeNotifier {
  int _count = 0;
  bool _like = false; // 视频点赞
  double _speed = 1.0; // 视频倍速
  bool _collect = false; // 视频收藏
  List _videoList = []; // 视频列表

  int get count => _count;
  bool get like => _like;
  bool get collect => _collect;
  List get videoList => _videoList;
  double get speed => _speed;

  void switchLike() {
    _like = !_like;
    notifyListeners();
  }

  // 切换收藏
  void switchCollect() {
    _collect = !_collect;
    notifyListeners();
  }

  void changeSpeed(speed) {
    _speed = speed;
    notifyListeners();
  }

  // 获取视频列表数据
  void setVideoListData(list) {
    _videoList = list;
    notifyListeners();
  }
}
