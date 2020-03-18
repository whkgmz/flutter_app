// 此页面主要功能为配置路由规则

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_rush/page/mine.dart';
import 'package:flutter_rush/page/home_page.dart';
import 'package:flutter_rush/page/login.dart';
import 'package:flutter_rush/page/save.dart';

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
// // 路由传参
// Handler routingReferenceHanderl = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   String id = params['id'].first;
//   return RoutingReference(id: id);
// });

// // 登陆页面
// Handler loginHanderl = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return Login();
// });
