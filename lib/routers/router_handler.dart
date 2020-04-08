// 此页面主要功能为配置路由规则

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_rush/page/mine.dart';
import 'package:flutter_rush/page/home_page.dart';
import 'package:flutter_rush/page/login.dart';
import 'package:flutter_rush/page/save.dart';
import 'package:flutter_rush/page/register.dart';
import 'package:flutter_rush/widgets/bottom_navigation.dart';
import 'package:flutter_rush/page/video_list_page.dart';
import 'package:flutter_rush/page/video_play_page.dart';

Handler rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return BottomNavigationWidget();
  },
);
// 首页
Handler homePageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MyHomePage();
  },
);

// 我的页面
Handler minePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return MinePage();
});

// 登录页面
Handler loginPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Login();
});

// 收藏页
Handler savePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SaveWidget();
});
// 注册页
Handler registerPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterPage();
});
// video列表页
Handler videoListPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return VideoListPage();
});
// video播放页
Handler videoPlayPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return VideoPlayPage();
});
// // 路由传参
// Handler routingReferenceHanderl = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   String id = params['id'].first;
//   return RoutingReference(id: id);
// });
